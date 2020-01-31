

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
savePath = '/home/alexander/Desktop/CVPR/4_State_of_Art/DehazeNet-master/illusions/';


t = 0.2;

for i=0:101
   
    img = im2double(imread([pathImages,num2str(i),'.png']));
    haze = img*t + (1-t);
    imwrite(haze,[savePath,num2str(i),'.png'])
    
end
