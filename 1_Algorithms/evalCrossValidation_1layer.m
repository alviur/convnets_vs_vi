path = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB6_';

r = 3;
nk = 8;

maxMeans = 10;

meanAssimilation = zeros(maxMeans,128,2);
meanContrast = zeros(maxMeans,6,2);

for i=1:maxMeans
    
   load([path,num2str(i),'/Illusions_r',num2str(r),'_nk',num2str(nk),'_p2.mat'])
   
  % Assimilation

    img1 = rgb2gray(squeeze(illusions(10,:,:,:)));

    img2 = rgb2gray(squeeze(illusions(11,:,:,:)));
    
    
    meanAssimilation(i,:,1) = squeeze(img1(63,:));
    meanAssimilation(i,:,2) = squeeze(img2(63,:));

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



    % Contrast

    posDun = [19,24,22;105,110,22;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];

    img1 = rgb2gray(squeeze(illusions(34,:,:,:)));
    imshow(img1)

    cont = 1;
    
    meanContrast(i,:,1) = img1(posDun(cont,3),posDun(cont,1):posDun(cont,2));
    meanContrast(i,:,2) = img1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2));

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


    
    
end



%% Compute mean plot

assimMean = sum(meanAssimilation,1)/maxMeans;
contrastMean = sum(meanContrast,1)/maxMeans;

strAssim1 = std(meanAssimilation(:,:,1),0,1);
strAssim2 = std(meanAssimilation(:,:,2),0,1);

strContrast1 = std(meanContrast(:,:,1),0,1);
strContrast2 = std(meanContrast(:,:,2),0,1);

subplot(1,2,1)
plot(assimMean(:,:,1))
hold on
plot(assimMean(:,:,2))
grid on
title('Mean assimilation')
subplot(1,2,2)
plot(strAssim1)
hold on
plot(strAssim2)
title('std assimilation')
grid on


figure
subplot(1,2,1)
plot(contrastMean(:,:,1))
hold on
plot(contrastMean(:,:,2))
grid on
title('Mean contrast')
subplot(1,2,2)
plot(strContrast1)
hold on
plot(strContrast2)
title('std contrast')
grid on
%%

plot(meanAssimilation(1,:,1))
hold on
plot(meanAssimilation(2,:,1))
hold on
plot(meanAssimilation(3,:,1))
hold on
plot(meanAssimilation(4,:,1))
hold on
plot(meanAssimilation(5,:,1))
hold on
plot(meanAssimilation(6,:,1))
hold on
plot(meanAssimilation(7,:,1))
hold on
plot(meanAssimilation(8,:,1))
hold on
plot(meanAssimilation(9,:,1))
hold on
plot(meanAssimilation(10,:,1))


plot(meanAssimilation(1,:,2))
hold on
plot(meanAssimilation(2,:,2))
hold on
plot(meanAssimilation(3,:,2))
hold on
plot(meanAssimilation(4,:,2))
hold on
plot(meanAssimilation(5,:,2))
hold on
plot(meanAssimilation(6,:,2))
hold on
plot(meanAssimilation(7,:,2))
hold on
plot(meanAssimilation(8,:,2))
hold on
plot(meanAssimilation(9,:,2))
hold on
plot(meanAssimilation(10,:,2))