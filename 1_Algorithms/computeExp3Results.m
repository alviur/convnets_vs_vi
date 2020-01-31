


kernelSize = [3,5,7,11,15];
numKernels = [8,16,32,64,128];
poolingSize = [2,4,8];

% matPath = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/numpy/';
% matPath = '/home/alexander/Desktop/CVPR/4_State_of_Art/DehazeNet-master/mat/';
matPath = '/home/alexander/Desktop/CVPR/temp/vgg16/';
savePath = '/home/alexander/Desktop/CVPR/temp/results/0_temp/'; 
originalPath = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/'
txtfile = '/home/alexander/Desktop/CVPR/temp/results/5_temp/';


%% White

cont = 1;
data = zeros(25,14);

imagesWhite = zeros(7,256,256,3);

for i=0:6
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    imagesWhite(i+1,:,:,:) = im;
    
    imshow(squeeze(imagesWhite(i+1,:,:,:)))
 

   % replication=measureWhiteGray(illusions(1:7,:,:,:),kernelSize(i))
    

%         kernelSize(i)
%         
%         pause 

    cont = cont + 1;

end

replication=measureWhiteGray2(imagesWhite)
% csvwrite('test.csv',data)
%% White Color

cont = 1;
data = zeros(25,14);

imagesWhite = zeros(7,256,256,3);

for i=51:56
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    imagesWhite(cont,:,:,:) = im;
    
%     imshow(squeeze(imagesWhite(cont,:,:,:)))
 

   % replication=measureWhiteGray(illusions(1:7,:,:,:),kernelSize(i))
    

%         kernelSize(i)
%         
%         pause 
 
    cont = cont + 1;

end

replication=measureWhiteColor2(imagesWhite)
%% Dungeon

cont = 1;

imagesDungeon = zeros(12,256,256);
i=7;

while i<18 
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
     
    imagesDungeon(cont,:,:,:) = im;
    
    path = [matPath,num2str(i+1),'.png.mat']
     
    load(path)
    
    imagesDungeon(cont+1,:,:,:) = im;     
    i 
    
%     imshow(squeeze(imagesDungeon(cont+1,:,:,:)))
%    
% 
% %         kernelSize(i)
% %         
%         pause 

    cont = cont + 2;
    i = i+2;

end
replication=measureDungeonGray2(imagesDungeon,1,1);

% csvwrite('/media/alexander/lex_usb/dungeonGrayKernel.csv',data)

%% Dungeon Color

cont = 1;

imagesDungeon = zeros(12,256,256,3);
i=58;

while i<69
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    imagesDungeon(cont,:,:,:) = im;
    
    path = [matPath,num2str(i+1),'.png.mat']
     
    load(path)
    
    imagesDungeon(cont+1,:,:,:) = im;    
    i 
    
%     imshow(squeeze(imagesDungeon(cont+1,:,:,:)))
%    
% 
% %         kernelSize(i)
% %         
%         pause 

    cont = cont + 2;
    i = i+2;

end
replication=measureDungeonColor2(imagesDungeon)


%% Hong-Shevell rings Gray

cont = 1;

imagesShevell = zeros(12,256,256,3);
i=39;

while i<50
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    imagesShevell(cont,:,:,:) = im; 
    
    path = [matPath,num2str(i+1),'.png.mat']
     
    load(path)
    
    imagesShevell(cont+1,:,:,:) = im;    
    i 
    
%     imshow(squeeze(imagesShevell(cont+1,:,:,:)))
%     pause
   

%         kernelSize(i)
%          
         

    cont = cont + 2;
    i = i+2;

end
replication=measureShevellGray2(imagesShevell);

%% Hong-Shevell rings Color

cont = 1;

imagesShevell = zeros(12,256,256,3);
i=90;

while i<101
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    imagesShevell(cont,:,:,:) = im; 
    
    path = [matPath,num2str(i+1),'.png.mat']
     
    load(path)
    
    imagesShevell(cont+1,:,:,:) = im;    
    i 
    
%     imshow(squeeze(imagesShevell(cont+1,:,:,:)))
%     pause
   

%         kernelSize(i)
%          
         

    cont = cont + 2;
    i = i+2;

end
replication=measureShevellColor2(imagesShevell)

%% Chevreul Gray

i = 19;
cont = 1;

heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7];

while i<26
    
    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    subplot(4,2,cont)
    plot(im(128,:,1))
    grid on
    title(['Target size:',num2str(int8(heightC(cont)*256))])
    cont = cont + 1;
    i = i+1; 
    
    
end


i = 26;
cont = 1;

heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7];
figure
while i<33
    
    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    subplot(4,2,cont)
    plot(im(128,:,1))
    grid on
    title(['Target size:',num2str(int8(heightC(cont)*256))])
    cont = cont + 1;
    i = i+1; 
    
    
end

%% Luminance Gradient

i = 33;
cont = 1;

heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7];

while i<39
    
    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
    
    subplot(4,2,cont)
    plot(im(42,:,1))
    grid on
    title(['Target size:',num2str(int8(heightC(cont)*256))])
    cont = cont + 1;
    i = i+1; 
    
    
end

%% Luminance Gradient


cont = 1;
 
imagesLum = zeros(12,256,256);
i=33;

while i<38 
  
    %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

    path = [matPath,num2str(i),'.png.mat']
    
    load(path)
     
    imagesLum(cont,:,:,:) = im;
    
    
%     imshow(squeeze(imagesDungeon(cont+1,:,:,:)))
%    
% 
% %         kernelSize(i)
% %         
%         pause 

    cont = cont + 1;
    i = i+1;

end

replication=measureLuminanceGray2(imagesLum)