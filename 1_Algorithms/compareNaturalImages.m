 

path1 = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/numpy/';
path2 = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';

files1 = dir([path1,'k*']);
files2 = dir([path2,'k*']);


for i=1: length(files1)

    img = im2double(imread([path2,files2(i).name]));
    
    load([path1,files2(i).name,'.mat'])
    
    differences = img-im;
    subplot(1,2,1)
    imshow(img,[])
    subplot(1,2,2)
    imshow(im,[])
    max(max(differences))

    
    pause

end
%%
i=7
while i<102

    img = im2double(rgb2gray(imread([path2,num2str(i),'.png'])));
    
    load([path1,num2str(i),'.png','.mat'])
    
%     differences = img-rgb2gray(im);
%     subplot(1,2,1) 
%      imshow(rgb2gray(im),[])
%     subplot(1,2,2)
%     imshow(differences,[])
%     max(max(differences))

    subplot(1,2,1) 
    imshow(rgb2gray(im),[])
    load([path1,num2str(i+1),'.png','.mat'])
    subplot(1,2,2)
     imshow(rgb2gray(im),[])    
    pause
    i=i+2

end

%%

img = im2double(rgb2gray(imread([path2,'landscape2.png'])));
load('landscape2.png.mat')
differences = img-rgb2gray(im(:,:,1:3));
subplot(1,2,1)
imshow(img,[])
subplot(1,2,2)
imshow(differences,[])
max(max(differences))

%%

img = im2double(rgb2gray(imread([path2,'landscape1.png'])));
load('landscape1.png.mat')
differences = img-rgb2gray(im(:,:,1:3));
subplot(1,2,1)
imshow(img,[])
subplot(1,2,2)
imshow(differences,[])
max(max(differences))

%%

img = im2double((imread([path2,'kcheessimrs.jpg'])));
load('kcheessimrs.jpg.mat')
differences = img-(im(:,:));
subplot(1,2,1)
imshow(img,[])
subplot(1,2,2)
imshow(differences,[])
max(max(differences))

%% Super Resolution


original = im2double(rgb2gray(imread('/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/17.png')));
SR = im2double(rgb2gray(imread('/home/alexander/Desktop/CVPR/4_State_of_Art/Image-Super-Resolution-master/results/ans.png')));

differences = original-SR;

subplot(1,2,1)
imshow(original,[])
subplot(1,2,2)
imshow(differences,[])
max(max(differences))

%% Inpainting


