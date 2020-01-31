% Execute this part first
% Load AlexNet
net = googlenet;


%% Dungeon

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
% 
savePath = '/home/alexander/Desktop/CVPR/temp/google/';
 posDun = [64,64,61,66,45,56];

 i=7;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirstGooglenet(image0,net))/128;
%     save([savePath,num2str(i),'.png.mat'],'im')
    subplot(1,2,1)
    imshow(image0,[])
    subplot(1,2,2)
    imshow(sumConv1_1,[])
    

    
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    sumConv1_2 = (forwardFirstGooglenet(image1,net))/128;    %image0=divisiveNormalization(image0);
    figure
    subplot(1,2,1)
    imshow(image1,[])
    subplot(1,2,2)
    imshow(sumConv1_2,[])
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
    sumConv1_1 = (forwardFirstGooglenet(image0,net))/96;
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
sumConv1_1 = (forwardFirstGooglenet(image0,net))/64;
plot(sumConv1_1(64,:))
grid on
figure
imshow(sumConv1_1)