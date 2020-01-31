path = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB6_';

r = 5;
nk = 8;

maxMeans = 1;

meanAssimilation1 = zeros(maxMeans,64,2);

meanHongShevell1 = zeros(maxMeans,64,2);


meanContrast1 = zeros(maxMeans,13,2);


% meanwhite1 = zeros(maxMeans,6,2);
meanwhite1 = zeros(maxMeans,7,2);


meanChevreul1= zeros(maxMeans,45,1);

cont = 1;

for i=1:maxMeans
    
%    load([path,num2str(i),'/Illusions_r',num2str(r),'_nk',num2str(nk),'_p2.mat'])
   
   % White ========================
   
   posDun = [38,44,41;89,95,92];
%     posDun = [32,37,34;84,89,86];

    temp = (squeeze(illusions(1,:,:,:)));

    img1 = rgb2gray(temp(:,:,:));

   
%     imshow(img1)
%     pause
% %     
%         figure
%     plot((img1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
%     hold on
%     plot((img1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2))))
%     grid on  
%     pause
    
    
    
    meanwhite1(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanwhite1(i,:,2) = img1(posDun(cont+1,3),posDun(cont+1,1):posDun(cont+1,2));

   
   % Dungeon ========================
   
   temp1 = (squeeze(illusions(10,:,:,:)));
   temp2 = (squeeze(illusions(11,:,:,:)));

    img1_1 = rgb2gray(temp1(:,:,:));
   

    img2_1 = rgb2gray(temp2(:,:,:));

    
    
    meanAssimilation1(i,:,1) = squeeze(img1_1(63,33:96));

    meanAssimilation1(i,:,2) = squeeze(img2_1(63,33:96));
 

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

    % Hong- Shevell ========================
    
   temp1 = (squeeze(illusions(40,:,:,:)));
   temp2 = (squeeze(illusions(41,:,:,:)));    
    
    img1_1 =rgb2gray( temp1(:,:,:));

    img2_1 = rgb2gray(temp2(:,:,:));

    
    meanHongShevell1(i,:,1) = squeeze(img1_1(63,1:64));
    meanHongShevell1(i,:,2) = squeeze(img2_1(63,1:64));


    % img1 = (squeeze(illusions(59,:,:,3)));
    % 
    % img2 = (squeeze(illusions(60,:,:,3)));
% 
%     subplot(1,2,1)
%     imshow(img1)
%     subplot(1,2,2)
%     imshow(img2)
%     figure
%     plot(squeeze(img1(63,:)))
%     hold on
%     plot(squeeze(img2(63,:)))
%     grid on
%     title('Dungeon f0.03')
%     legend('Black rounded','White rounded')
%     
%     pause


 % Luminance gradient ========================

    %19,25,22,104,110,22;

    posDun = [16,28,22,101,113,22;18,26,22,104,111,22;17,27,22,103,112,22;16,28,22,102,113,22];
    temp1 = (squeeze(illusions(36,:,:,:)));
%     
%     imshow(temp1)
%     pause
%     
    
    img1 = rgb2gray(temp1(:,:,:));


    cont = 1;
    
    meanContrast1(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));

    
    meanContrast1(i,:,2) = img1(posDun(cont,6),posDun(cont,4):posDun(cont,5));


%     figure
%     plot((img1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
%     hold on
%     plot((img1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2))))
%     grid on     
% 
%     title('Contrast f0.03')
%     legend('Black rounded','White rounded')
%     
%     pause

 % Chevreul Effect ========================

    

    posDun = [43,87,64];

    temp1 = (squeeze(illusions(23,:,:,:)));
    img1 = temp1(:,:,:);

    
%     imshow(img1)
%     pause

     cont = 1;
%     
     meanChevreul1(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));

%     figure
%     plot((img1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
% 
%     grid on     
% 
%     title('Contrast f0.03')
%     legend('Black rounded','White rounded')
%     
%     pause


    
    
end



%% Compute mean plot

figuresPath = '/home/alexander/Desktop/CVPR/temp/figs_plot/';

assimMean1 = sum(meanAssimilation1,1)/maxMeans;
contrastMean1 = sum(meanContrast1,1)/maxMeans;
hongMean1 = sum(meanHongShevell1,1)/maxMeans;
whiteMean1 = sum(meanwhite1,1)/maxMeans;
chevreulMean1 = sum(meanChevreul1,1)/maxMeans;



% 
% strAssim1 = std(meanAssimilation(:,:,1),0,1);
% strAssim2 = std(meanAssimilation(:,:,2),0,1);
% 
% strContrast1 = std(meanContrast(:,:,1),0,1);
% strContrast2 = std(meanContrast(:,:,2),0,1);


% Plot White  =================
figure('rend','painters','pos',[10 10 100 100])
plot(whiteMean1(:,:,1),'Color','k','LineWidth',1.5)
hold on
plot(whiteMean1(:,:,2),'Color','b','LineWidth',1.5)
xlim([1 7])
set(gca,'xtick',[])
grid on
saveas(gcf,[figuresPath,'white_blue.svg'],'svg')
% title('White illusion')



% Plot Dungeon  =================
figure('rend','painters','pos',[10 10 100 100])
plot(assimMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_blue.svg'],'svg')


% title('Dungeon Effect')

% plot Luminance =================
figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 13])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_blue.svg'],'svg')
% title('Luminance gradient')



% Plot Hong Shevell =================
figure('rend','painters','pos',[10 10 100 100])
plot(hongMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(hongMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'hong_blue.svg'],'svg')



% Plot chevreul  =================
figure('rend','painters','pos',[10 10 100 100])
plot(chevreulMean1(:,:,1),'Color','b','LineWidth',0.8)
grid on
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'chevreul_red.svg'],'svg')
% xlim([1 45])
% ylim([0.9 1])
% title('Chevreul effect')

% xlim([1 45])
% ylim([0 1])
% title('Chevreul effect')

close all
% 
% subplot(1,2,1)
% plot(assimMean(:,:,1))
% hold on
% plot(assimMean(:,:,2))
% grid on
% title('Mean assimilation')
% subplot(1,2,2)
% plot(strAssim1)
% hold on
% plot(strAssim2)
% title('std assimilation')
% grid on
% 
% 
% figure
% subplot(1,2,1)
% plot(contrastMean(:,:,1))
% hold on
% plot(contrastMean(:,:,2))
% grid on
% title('Mean contrast')
% subplot(1,2,2)
% plot(strContrast1)
% hold on
% plot(strContrast2)
% title('std contrast')
% grid on
%%
% 
% plot(meanAssimilation(1,:,1))
% hold on
% plot(meanAssimilation(2,:,1))
% hold on
% plot(meanAssimilation(3,:,1))
% hold on
% plot(meanAssimilation(4,:,1))
% hold on
% plot(meanAssimilation(5,:,1))
% hold on
% plot(meanAssimilation(6,:,1))
% hold on
% plot(meanAssimilation(7,:,1))
% hold on
% plot(meanAssimilation(8,:,1))
% hold on
% plot(meanAssimilation(9,:,1))
% hold on
% plot(meanAssimilation(10,:,1))
% 
% 
% plot(meanAssimilation(1,:,2))
% hold on
% plot(meanAssimilation(2,:,2))
% hold on
% plot(meanAssimilation(3,:,2))
% hold on
% plot(meanAssimilation(4,:,2))
% hold on
% plot(meanAssimilation(5,:,2))
% hold on
% plot(meanAssimilation(6,:,2))
% hold on
% plot(meanAssimilation(7,:,2))
% hold on
% plot(meanAssimilation(8,:,2))
% hold on
% plot(meanAssimilation(9,:,2))
% hold on
% plot(meanAssimilation(10,:,2))