% Execute this part first
% Load AlexNet
net = resnet101;


%% Dungeon

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
% 
savePath = '/home/alexander/Desktop/CVPR/temp/google/';
 posDun = [32,63,70,66,73,70];

 i=7;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirstres50(image0,net))/64;
%     save([savePath,num2str(i),'.png.mat'],'im')
    imshow(sumConv1_1,[])

    
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    sumConv1_2 = (forwardFirstres50(image1,net))/64;    %image0=divisiveNormalization(image0);
%     save([savePath,num2str(i+1),'.png.mat'],'im')
    
    figure
    plot((sumConv1_1(posDun(cont),:)))
    hold on
    plot(((sumConv1_2(posDun(cont),:))))
    grid on
    title('Dungeon f0.03')
    legend('Black rounded','White rounded')
    pause   
    

     close all
    i = i+2;
    cont = cont + 1;
 
    
end

%% LumGradient

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
posDun = [19,24,22;105,110,22;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];

 i=33;
 
 cont = 1;
 
while i<39 
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirstres50(image0,net))/64;
%     save([savePath,num2str(i),'.png.mat'],'im')


    sumConv1_1(posDun(cont,1):posDun(cont,2),posDun(cont,3))
    
    plot((sumConv1_1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
    hold on
    plot((sumConv1_1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2))))
    grid on
    
    
    title('Contrast f0.03')
    legend('Black rounded','White rounded')
%     
% 
%     %sumConv1_2 = forwardSecond(image0,net);
    figure
    imshow(sumConv1_1,[])
    pause
     close all
    i = i+1;
    cont = cont + 2;
 
    
end

%%

image0 = imresize(imread([pathImages,num2str(0),'.png']),[256,256]);
sumConv1_1 = (forwardFirstres50(image0,net))/64;
plot(sumConv1_1(64,:))
grid on
figure
imshow(sumConv1_1)

%%

figure
plot(squeeze(illusions(8,posDun(cont),:,1)))
hold on
plot(squeeze(illusions(9,posDun(cont),:,1)))
grid on
title('Dungeon f0.03')
legend('Black rounded','White rounded')
pause   

%%

plot((illusions(posDun(cont,3),posDun(cont,1):posDun(cont,2),1)))
hold on
plot((illusions(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2),1)))
grid on     
    
title('Contrast f0.03')
legend('Black rounded','White rounded')