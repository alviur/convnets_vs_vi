% Execute this part first
% Load AlexNet
 net = vgg16;


%% Dungeon

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
% 
savePath = '/home/alexander/Desktop/CVPR/temp/vgg16/';
 posDun = [125,33,33,32,35,34];

 i=7;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirstvgg(image0,net))/128;
%     save([savePath,num2str(i),'.png.mat'],'im')
%     imshow(im,[])

    
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    sumConv1_2 = (forwardFirstvgg(image1,net))/128;    %image0=divisiveNormalization(image0);
%     save([savePath,num2str(i+1),'.png.mat'],'im')
    
    plot((sumConv1_1(posDun(cont),:)))
    hold on
    plot(((sumConv1_2(posDun(cont),:))))
    grid on
    title('Dungeon f0.03')
    legend('Black rounded','White rounded')
    
%     
% 
%     %sumConv1_2 = forwardSecond(image0,net);
%     figure
    figure
    imshow(sumConv1_1,[])
    pause
    close all
%     close all
    i = i+2;
    cont = cont + 1;
 
    
end

%% LumGradient

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
posDun = [39,47,43;210,218,43;8,13,43;50,56,43;7,13,43;50,56,43;7,14,43;50,57,43;6,14,43;49,57,43];

 i=33;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirstvgg(image0,net))/96;
%     save([savePath,num2str(i),'.png.mat'],'im')


    
    plot((sumConv1_1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
    hold on
    plot((sumConv1_1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2))))
    grid on
    title('Contrast f0.03')
    legend('Black rounded','White rounded')    
%     
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
sumConv1_1 = (forwardFirstvgg(image0,net))/64;
plot(sumConv1_1(64,:))
grid on
figure
imshow(sumConv1_1,[])