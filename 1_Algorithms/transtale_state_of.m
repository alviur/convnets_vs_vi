

path = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/numpy/';

illusions = zeros(102,128,128,3);


for i=0:101
    
    
    load([path,num2str(i),'.png.mat'])
    
    illusions(i+1,:,:,:) = im;
    
%     imshow(im)
%     pause
    
    
end