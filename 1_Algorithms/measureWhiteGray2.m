


function replication = measureWhiteGray2(illusions)

    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masks/';
    
    replication = zeros(size(illusions,1),1);
    
    

    for i=1:size(illusions,1)

        rawImage = rgb2gray(imread([pathMasks,num2str(i-1),'.png']));
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');

        image2Eval = rgb2gray(squeeze(illusions(i,:,:,:)));

        Inew = BW.*image2Eval;
        
        int8(size(illusions,2)/2)

%         imshow(Inew(:,1:int8(size(illusions,2)/2),:)   )
%         figure
%         imshow(Inew(:,(size(illusions,2)/2):(size(illusions,2)),:))
%         
%         size(Inew(:,(size(illusions,2)/2):(size(illusions,2)),:))
% 
%         pause
%         close all        
        
        Target1 = sum(sum(Inew(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area
        Target2 = sum(sum(Inew(:,(size(illusions,2)/2):(size(illusions,2)))))/blobMeasurements(1).Area
        
        replication(i,1)= Target2 -Target1


        imshow(Inew)
        figure
        imshow(image2Eval)
        pause
        close all



    end

end
