path = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB6_';

r = 5;
nk = 8;

maxMeans = 1;
freq = 3;
% freqVect = [64,64,24,24,45;64,64,24,35,45;76,64,24,54,45];
freqVect = [64,64,24,7,45;64,64,24,11,45;76,64,24,23,45];

limitsDungeon = [33,96;33,96;25,100];
dungeonIndex = [61,62;63,64;67,68];
% dungeonIndex = [58,59;63,64;67,68];
pixelDungeon = [63,70,70];

lumGradIndex = [85,86,88];
% limitsLum =[19,42,31,64,87,91;19,53,28,64,98,88;19,72,32,64,117,93];
limitsLum =[19,25,22,104,110,22;17,27,22,102,112,22;11,33,22,96,118,22];



meanAssimilation1 = zeros(maxMeans,freqVect(freq,1),2);
meanAssimilation2 = zeros(maxMeans,freqVect(freq,1),2);
meanAssimilation3 = zeros(maxMeans,freqVect(freq,1),2);

meanContrast1 = zeros(maxMeans,freqVect(freq,4),2);
meanContrast2 = zeros(maxMeans,freqVect(freq,4),2);
meanContrast3 = zeros(maxMeans,freqVect(freq,4),2);


cont = 1;

for i=1:maxMeans
    
%    load([path,num2str(i),'/Illusions_r',num2str(r),'_nk',num2str(nk),'_p2.mat'])
   
   
   
   % Dungeon ========================
   
   temp1 = (squeeze(illusions(dungeonIndex(freq,1),:,:,:)));
   temp2 = (squeeze(illusions(dungeonIndex(freq,2),:,:,:)));

    img1_1 = temp1(:,:,1);
    img1_2 = temp1(:,:,2);
    img1_3 = temp1(:,:,3);

    img2_1 = temp2(:,:,1);
    img2_2 = temp2(:,:,2);
    img2_3 = temp2(:,:,3);
    
    
    meanAssimilation1(i,:,1) = squeeze(img1_1(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    meanAssimilation2(i,:,1) = squeeze(img1_2(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    meanAssimilation3(i,:,1) = squeeze(img1_3(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    meanAssimilation1(i,:,2) = squeeze(img2_1(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    meanAssimilation2(i,:,2) = squeeze(img2_2(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    meanAssimilation3(i,:,2) = squeeze(img2_3(pixelDungeon(freq),limitsDungeon(freq,1):limitsDungeon(freq,2)));
    
    
    

    % img1 = (squeeze(illusions(59,:,:,3)));
    % 
    % img2 = (squeeze(illusions(60,:,:,3)));

    % subplot(1,2,1)
    % imshow(img1)
    % subplot(1,2,2)
    % imshow(img2)
%     figure
%     plot(squeeze(img1(63,:)))
%     hold on
%     plot(squeeze(img2(63,:)))
%     grid on
%     title('Dungeon f0.03')
%     legend('Black rounded','White rounded')
%     
%     pause

    % title('green')
    % title('blue')
    % title('Red')

   


 % Luminance gradient ========================

   


    temp1 = (squeeze(illusions(lumGradIndex(freq),:,:,:)));
%     
%     imshow(temp1)
%     pause
%     
    
    img1 = temp1(:,:,1);
    img2 = temp1(:,:,2);
    img3 = temp1(:,:,3);

    cont = 1;
    
    meanContrast1(i,:,1) = img1(limitsLum(freq,3),limitsLum(freq,1):limitsLum(freq,2));
    meanContrast2(i,:,1) = img2(limitsLum(freq,3),limitsLum(freq,1):limitsLum(freq,2));
    meanContrast3(i,:,1) = img3(limitsLum(freq,3),limitsLum(freq,1):limitsLum(freq,2));
    
    meanContrast1(i,:,2) = img1(limitsLum(freq,6),limitsLum(freq,4):limitsLum(freq,5));
    meanContrast2(i,:,2) = img2(limitsLum(freq,6),limitsLum(freq,4):limitsLum(freq,5));
    meanContrast3(i,:,2) = img3(limitsLum(freq,6),limitsLum(freq,4):limitsLum(freq,5));
    
   




%     figure
%     plot((img1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
%     hold on
%     plot((img1(limitsLum(freq,4):limitsLum(freq,5),limitsLum(freq,6))
%     grid on     
% 
%     title('Contrast f0.03')
%     legend('Black rounded','White rounded')
%     imshow(temp1)
%     
%     pause

 

    
    
end



%% Compute mean plot

figuresPath = '/home/alexander/Desktop/CVPR/temp/figs_plot/';

assimMean1 = sum(meanAssimilation1,1)/maxMeans;
assimMean2 = sum(meanAssimilation2,1)/maxMeans;
assimMean3 = sum(meanAssimilation3,1)/maxMeans;

contrastMean1 = sum(meanContrast1,1)/maxMeans;
contrastMean2 = sum(meanContrast2,1)/maxMeans;
contrastMean3 = sum(meanContrast3,1)/maxMeans;


% Plot Dungeon  =================
figure('rend','painters','pos',[10 10 100 100])
plot(assimMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,1)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_blue.svg'],'svg')

% title('Dungeon Effect')

figure('rend','painters','pos',[10 10 100 100])
plot(assimMean2(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean2(:,:,2),'Color','g','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,1)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_green.svg'],'svg')

% title('Dungeon Effect')

figure('rend','painters','pos',[10 10 100 100])
plot(assimMean3(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean3(:,:,2),'Color','r','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,1)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_red.svg'],'svg')

% title('Dungeon Effect')

% plot Luminance =================
figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,4)])
ylim([0 1])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_blue.svg'],'svg')
% title('Luminance gradient')

figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean2(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean2(:,:,2),'Color','g','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,4)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_green.svg'],'svg')


figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean3(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean3(:,:,2),'Color','r','LineWidth',0.8)
grid on
xlim([1 freqVect(freq,4)])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_red.svg'],'svg')








close all
