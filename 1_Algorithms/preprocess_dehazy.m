

pathClean = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/NYU_GT/';
pathHazy = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/NYU_Hazy/';

saveClean = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/resized/clean/';
saveHazy = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/resized/hazy/';

newSize = 128;

numImages = 1449;

contImage = 1;


for i=1:numImages
    
    
    clean = imresize(imread([pathClean,num2str(i),'_Image_.bmp']),[newSize 640]);
    hazy = imresize(imread([pathHazy,num2str(i),'_Hazy.bmp']),[newSize 640]);
    
%     imshow(clean)
%     pause
    contPos = 1;
    for j=0:8
        imwrite(clean(:,j*64+1:j*64+newSize,:),[saveClean,num2str(contImage),'.png']);
        imwrite(hazy(:,j*64+1:j*64+newSize,:),[saveHazy,num2str(contImage),'.png']);
        
        contImage = contImage + 1;
        
    end
%     imwrite(clean,[saveClean,num2str(i),'.png']);
%     imwrite(hazy,[saveHazy,num2str(i),'.png']);

%     
end
