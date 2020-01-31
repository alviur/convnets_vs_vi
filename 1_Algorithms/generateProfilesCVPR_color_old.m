path = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB6_';

r = 5;
nk = 8;

maxMeans = 10;

meanAssimilation1 = zeros(maxMeans,64,2);
meanAssimilation2 = zeros(maxMeans,64,2);
meanAssimilation3 = zeros(maxMeans,64,2);

meanHongShevell1 = zeros(maxMeans,64,2);
meanHongShevell2 = zeros(maxMeans,64,2);
meanHongShevell3 = zeros(maxMeans,64,2);

meanContrast1 = zeros(maxMeans,13,2);
meanContrast2 = zeros(maxMeans,13,2);
meanContrast3 = zeros(maxMeans,13,2);

meanwhite1 = zeros(maxMeans,7,2);
meanwhite2 = zeros(maxMeans,7,2);
meanwhite3 = zeros(maxMeans,7,2);

meanChevreul1= zeros(maxMeans,45,1);
meanChevreul2= zeros(maxMeans,45,1);
meanChevreul3= zeros(maxMeans,45,1);
cont = 1;

for i=1:maxMeans
    
%    load([path,num2str(i),'/Illusions_r',num2str(r),'_nk',num2str(nk),'_p2.mat'])
   
   % White ========================
   
   posDun = [38,44,41;89,95,92];
%     posDun = [32,37,34;84,89,86];

    temp = ((squeeze(illusions(52,:,:,:))));

    img1 = temp(:,:,1);
    img2 = temp(:,:,2);
    img3 = temp(:,:,3);
   
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
    
    meanwhite2(i,:,1) = img2(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanwhite2(i,:,2) = img2(posDun(cont+1,3),posDun(cont+1,1):posDun(cont+1,2));
    
    meanwhite3(i,:,1) = img3(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanwhite3(i,:,2) = img3(posDun(cont+1,3),posDun(cont+1,1):posDun(cont+1,2));
  
   
   % Dungeon ========================
   
%    temp1 = ((squeeze(illusions(59,:,:,:))));
%    temp2 = ((squeeze(illusions(60,:,:,:))));

   temp1 = ((squeeze(illusions(61,:,:,:))));
   temp2 = ((squeeze(illusions(62,:,:,:))));   
   
    img1_1 = temp1(:,:,1);
    img1_2 = temp1(:,:,2);
    img1_3 = temp1(:,:,3);

    img2_1 = temp2(:,:,1);
    img2_2 = temp2(:,:,2);
    img2_3 = temp2(:,:,3);
    
    
    meanAssimilation1(i,:,1) = squeeze(img1_1(63,33:96));
    meanAssimilation2(i,:,1) = squeeze(img1_2(63,33:96));
    meanAssimilation3(i,:,1) = squeeze(img1_3(63,33:96));
    meanAssimilation1(i,:,2) = squeeze(img2_1(63,33:96));
    meanAssimilation2(i,:,2) = squeeze(img2_2(63,33:96));
    meanAssimilation3(i,:,2) = squeeze(img2_3(63,33:96));

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
    
   temp1 = ((squeeze(illusions(95,:,:,:))));
   temp2 = ((squeeze(illusions(96,:,:,:))));    
    
    img1_1 = temp1(:,:,1);
    img1_2 = temp1(:,:,2);
    img1_3 = temp1(:,:,3);

    img2_1 = temp2(:,:,1);
    img2_2 = temp2(:,:,2);
    img2_3 = temp2(:,:,3);
    
    meanHongShevell1(i,:,1) = squeeze(img1_1(63,1:64));
    meanHongShevell2(i,:,1) = squeeze(img1_2(63,1:64));
    meanHongShevell3(i,:,1) = squeeze(img1_3(63,1:64));
    meanHongShevell1(i,:,2) = squeeze(img2_1(63,1:64));
    meanHongShevell2(i,:,2) = squeeze(img2_2(63,1:64));
    meanHongShevell3(i,:,2) = squeeze(img2_3(63,1:64));

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

    

%     posDun = [19,42,31;64,87,91;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];
    
%     posDun =[19,25,22,104,110,22;17,27,22,102,112,22;11,33,22,96,118,22];
    posDun = [16,28,22,101,113,22;18,26,22,104,111,22;17,27,22,103,112,22;16,28,22,102,113,22];

    temp1 = ((squeeze(illusions(86,:,:,:))));
%     
%     imshow(temp1)
%     pause
%     
    
    img1 = temp1(:,:,1);
    img2 = temp1(:,:,2);
    img3 = temp1(:,:,3);

    cont = 1;
    
    meanContrast1(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanContrast2(i,:,1) = img2(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanContrast3(i,:,1) = img3(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    
    meanContrast1(i,:,2) = img1(posDun(cont,6),posDun(cont,4):posDun(cont,5));
    meanContrast2(i,:,2) = img2(posDun(cont,6),posDun(cont,4):posDun(cont,5));
    meanContrast3(i,:,2) = img3(posDun(cont,6),posDun(cont,4):posDun(cont,5));

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

%     temp1 = ((squeeze(illusions(73,:,:,:))));
temp1 = ((squeeze(illusions(75,:,:,:))));
    img1 = temp1(:,:,1);
    img2 = temp1(:,:,2);
    img3 = temp1(:,:,3);
    
%     imshow(img1)
%     pause

     cont = 1;
%     
     meanChevreul1(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));
     meanChevreul2(i,:,1) = img2(posDun(cont,3),posDun(cont,1):posDun(cont,2));
     meanChevreul3(i,:,1) = img3(posDun(cont,3),posDun(cont,1):posDun(cont,2));
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
assimMean2 = sum(meanAssimilation2,1)/maxMeans;
assimMean3 = sum(meanAssimilation3,1)/maxMeans;

contrastMean1 = sum(meanContrast1,1)/maxMeans;
contrastMean2 = sum(meanContrast2,1)/maxMeans;
contrastMean3 = sum(meanContrast3,1)/maxMeans;

hongMean1 = sum(meanHongShevell1,1)/maxMeans;
hongMean2 = sum(meanHongShevell2,1)/maxMeans;
hongMean3 = sum(meanHongShevell3,1)/maxMeans;

whiteMean1 = sum(meanwhite1,1)/maxMeans;
whiteMean2 = sum(meanwhite2,1)/maxMeans;
whiteMean3 = sum(meanwhite3,1)/maxMeans;

chevreulMean1 = sum(meanChevreul1,1)/maxMeans;
chevreulMean2 = sum(meanChevreul2,1)/maxMeans;
chevreulMean3 = sum(meanChevreul3,1)/maxMeans;


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

figure('rend','painters','pos',[10 10 100 100])
plot(whiteMean2(:,:,1),'Color','k','LineWidth',1.5)
hold on
plot(whiteMean2(:,:,2),'Color','g','LineWidth',1.5)
xlim([1 7])
grid on
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'white_green.svg'],'svg')
% title('White illusion')

figure('rend','painters','pos',[10 10 100 100])
plot(whiteMean3(:,:,1),'Color','k','LineWidth',1.5)
hold on
plot(whiteMean3(:,:,2),'Color','r','LineWidth',1.5)
xlim([1 7])
grid on
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'white_red.svg'],'svg')
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

figure('rend','painters','pos',[10 10 100 100])
plot(assimMean2(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean2(:,:,2),'Color','g','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_green.svg'],'svg')

% title('Dungeon Effect')

figure('rend','painters','pos',[10 10 100 100])
plot(assimMean3(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(assimMean3(:,:,2),'Color','r','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'dungeon_red.svg'],'svg')

% title('Dungeon Effect')

% plot Luminance =================
figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 13])
ylim([0 1])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_blue.svg'],'svg')
% title('Luminance gradient')

figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean2(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean2(:,:,2),'Color','g','LineWidth',0.8)
grid on
xlim([1 13])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_green.svg'],'svg')


figure('rend','painters','pos',[10 10 100 100])
plot(contrastMean3(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(contrastMean3(:,:,2),'Color','r','LineWidth',0.8)
grid on
xlim([1 13])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'lum_red.svg'],'svg')


% Plot Hong Shevell =================
figure('rend','painters','pos',[10 10 100 100])
plot(hongMean1(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(hongMean1(:,:,2),'Color','b','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'hong_blue.svg'],'svg')

% title('Hong-Shevell rings')

figure('rend','painters','pos',[10 10 100 100])
plot(hongMean2(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(hongMean2(:,:,2),'Color','g','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'hong_green.svg'],'svg')


figure('rend','painters','pos',[10 10 100 100])
plot(hongMean3(:,:,1),'Color','k','LineWidth',0.8)
hold on
plot(hongMean3(:,:,2),'Color','r','LineWidth',0.8)
grid on
xlim([1 64])
set(gca,'xtick',[])
saveas(gcf,[figuresPath,'hong_red.svg'],'svg')


% Plot chevreul  =================
figure('rend','painters','pos',[10 10 100 100])
plot(chevreulMean1(:,:,1),'Color','r','LineWidth',0.8)
grid on
set(gca,'xtick',[])
ylim([0 1])
saveas(gcf,[figuresPath,'chevreul_red.svg'],'svg')
% xlim([1 45])

% title('Chevreul effect')

figure('rend','painters','pos',[10 10 100 100])
plot(chevreulMean2(:,:,1),'Color','g','LineWidth',0.8)
grid on
set(gca,'xtick',[])
 ylim([0 1])
saveas(gcf,[figuresPath,'chevreul_green.svg'],'svg')
% xlim([1 45])

% title('Chevreul effect')

figure('rend','painters','pos',[10 10 100 100])
plot(chevreulMean3(:,:,1),'Color','b','LineWidth',0.8)
grid on
set(gca,'xtick',[])
 ylim([0 1])
saveas(gcf,[figuresPath,'chevreul_blue.svg'],'svg')
% xlim([1 45])

% title('Chevreul effect')

pause
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


%% Denosing

dun = zeros(100,100);
Whi = zeros(100,100);
HS = zeros(100,100);
lum = zeros(100,100);


dun(:,1:50,1)= 0.33;
dun(:,50:end,1)= 0.795;

dun(:,1:50,2)= 0.795;
dun(:,50:end,2)= 0.461;

dun(:,1:50,3)= 0.489;
dun(:,50:end,3)= 0.429;

Whi(:,1:50,1)= 0.2845;
Whi(:,50:end,1)= 0.338;

Whi(:,1:50,2)= 0.307;
Whi(:,50:end,2)= 0.350;

Whi(:,1:50,3)= 0.394;
Whi(:,50:end,3)= 0.347;

HS(:,1:50,1)= 0.446;
HS(:,50:end,1)= 0.763;

HS(:,1:50,2)= 0.806;
HS(:,50:end,2)= 0.471;

HS(:,1:50,3)= 0.35;
HS(:,50:end,3)= 0.35;

lum(:,1:50,1)= 0.4988;
lum(:,50:end,1)= 0.4784;

lum(:,1:50,2)= 0.4209;
lum(:,50:end,2)= 0.563;

lum(:,1:50,3)= 0.6302;
lum(:,50:end,3)= 0.3836;

% imshow(dun)
% title('dungeon')
% figure
% imshow(Whi)
% title('White')
% figure
% imshow(HS)
% title('HS')
% figure
% imshow(lum)
% title('lum')

%% Dehazing

dun = zeros(100,100);
Whi = zeros(100,100);
HS = zeros(100,100);
lum = zeros(100,100);


dun(:,1:50,1)= 0;
dun(:,50:end,1)= 0.77;

dun(:,1:50,2)= 0;
dun(:,50:end,2)= 0.36;

dun(:,1:50,3)= 0;
dun(:,50:end,3)= 0.19;

Whi(:,1:50,1)= 0.138;
Whi(:,50:end,1)= 0.09;

Whi(:,1:50,2)= 0.152;
Whi(:,50:end,2)= 0.10;

Whi(:,1:50,3)= 0.211;
Whi(:,50:end,3)= 0.146;

HS(:,1:50,1)= 0;
HS(:,50:end,1)= 0.68;

HS(:,1:50,2)= 0;
HS(:,50:end,2)= 0.75;

HS(:,1:50,3)= 0;
HS(:,50:end,3)= 0.14;

lum(:,1:50,1)= 0.11;
lum(:,50:end,1)= 0.26;

lum(:,1:50,2)=0.21;
lum(:,50:end,2)= 0.11;

lum(:,1:50,3)= 0.46;
lum(:,50:end,3)= 0.05;

% imshow(dun)
% title('dungeon')
% figure
% imshow(Whi)
% title('White')
% figure
% imshow(HS)
% title('HS')
% figure
% imshow(lum)
% title('lum')

%% CC


dun = zeros(100,100);
Whi = zeros(100,100);
HS = zeros(100,100);
lum = zeros(100,100);


dun(:,1:50,1)= 0.91;
dun(:,50:end,1)= 0.935;

dun(:,1:50,2)= 0.9443;
dun(:,50:end,2)= 0.832;

dun(:,1:50,3)= 0.944;
dun(:,50:end,3)= 0.927;

Whi(:,1:50,1)= 0.7209;
Whi(:,50:end,1)= 0.80;

Whi(:,1:50,2)= 0.623;
Whi(:,50:end,2)= 0.58;

Whi(:,1:50,3)= 0.917;
Whi(:,50:end,3)= 0.87;

HS(:,1:50,1)= 0.90;
HS(:,50:end,1)= 0.93;

HS(:,1:50,2)= 0.925;
HS(:,50:end,2)= 0.81;

HS(:,1:50,3)= 0.872;
HS(:,50:end,3)= 0.918;

lum(:,1:50,1)= 0.857;
lum(:,50:end,1)= 0.870;

lum(:,1:50,2)=0.79;
lum(:,50:end,2)= 0.70;

lum(:,1:50,3)= 0.95;
lum(:,50:end,3)= 0.86;

% imshow(dun)
% title('dungeon')
% figure
% imshow(Whi)
% title('White')
% figure
% imshow(HS)
% title('HS')
% figure
% imshow(lum)
% title('lum')


