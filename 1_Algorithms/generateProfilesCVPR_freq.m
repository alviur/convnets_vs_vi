path = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB6_';

r = 5;
nk = 8;

maxMeans = 1;
freq = 1;
freqVect = [64,64,24,7,45;64,64,24,11,45;76,64,24,23,45];

limitsDungeon = [33,96;33,96;25,100];
dungeonIndex = [8,9;12,13;16,17];
pixelDungeon = [63,70,70];

lumGradIndex = [34,35,37];
limitsLum =[19,25,22,104,110,22;17,27,22,102,112,22;11,33,22,96,118,22];

meanAssimilation1 = zeros(maxMeans,freqVect(freq,1),2);
meanContrast1 = zeros(maxMeans,freqVect(freq,4),2);



cont = 1;

for i=1:maxMeans
    
%    load([path,num2str(i),'/Illusions_r',num2str(r),'_nk',num2str(nk),'_p2.mat'])
   

   % Dungeon ========================
   
   temp1 = (squeeze(illusions(dungeonIndex(freq,1),:,:,:)));
   temp2 = (squeeze(illusions(dungeonIndex(freq,2),:,:,:)));

    img1_1 = rgb2gray(temp1(:,:,:));
   

    img2_1 = rgb2gray(temp2(:,:,:));

    
    
    meanAssimilation1(i,:,1) = squeeze(img1_1(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));

    meanAssimilation1(i,:,2) = squeeze(img2_1(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
 

    % img1 = (squeeze(illusions(59,:,:,3)));
    % 
    % img2 = (squeeze(illusions(60,:,:,3)));

%     subplot(1,2,1)
%     imshow(img1_1)
%     subplot(1,2,2)
%     imshow(img2_1)
%     figure
%     plot(squeeze(img1_1(pixelDungeon(freq),:)))
%     hold on
%     plot(squeeze(img2_1(pixelDungeon(freq),:)))
%     grid on
%     title('Dungeon f0.03')
%     legend('Black rounded','White rounded')
%     
%     pause

    % title('green')
    % title('blue')
    % title('Red')



 % Luminance gradient ========================    
% 
%     posDun = [19,42,22;64,87,22;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];

    temp1 = (squeeze(illusions(lumGradIndex(freq),:,:,:)));
%     
%     imshow(temp1)
%     pause
%     
    
    img1 = rgb2gray(temp1(:,:,:));


    cont = 1;
    
    meanContrast1(i,:,1) = img1(limitsLum(freq,3),limitsLum(freq,1):limitsLum(freq,2));
    
    meanContrast1(i,:,2) = img1(limitsLum(freq,6),limitsLum(freq,4):limitsLum(freq,5));


    
    
end



%% Compute mean plot

figuresPath = '/home/alexander/Desktop/CVPR/temp/figs_plot/';

assimMean1 = sum(meanAssimilation1,1)/maxMeans;
contrastMean1 = sum(meanContrast1,1)/maxMeans;


% Plot Dungeon  =================
figure('rend','painters','pos',[10 10 100 100])
plot(assimMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,1)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_blue.svg'],'svg')


% plot Luminance =================
figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,4)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_blue.svg'],'svg')
% title('Luminance gradient')

close all

