


function replication = measureWhiteColor2(illusions)

    toShow = zeros(size(illusions,2),size(illusions,2),3);


%     pathMasks = '/home/alexander/Desktop/CVPR/temp/whiteTargets/';
    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masks/';
    
    replication = zeros(size(illusions,1),3);

    for i=1:size(illusions,1)

        rawImage = rgb2gray(imread([pathMasks,num2str(i-1),'.png']));
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');

        toShow(:,:,1) = squeeze(illusions(i,:,:,3));
        toShow(:,:,2) = squeeze(illusions(i,:,:,2));
        toShow(:,:,3) = squeeze(illusions(i,:,:,1));

        hsv = rgb2hsv(toShow);
        
        Inew1 = BW.*toShow(:,:,1);
        Inew2 = BW.*toShow(:,:,2);
        Inew3 = BW.*toShow(:,:,3);
        Ihsv = BW.*hsv(:,:,1);
        
        
        redSum1 = sum(sum(Inew1(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area;
        redSum2 = sum(sum(Inew1(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area;
        
        greenSum1 = sum(sum(Inew2(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area;
        greenSum2 = sum(sum(Inew2(:,(size(illusions,2)/2):(size(illusions,2)))))/blobMeasurements(1).Area;
        
        blueSum1 = sum(sum(Inew3(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area;
        blueSum2 = sum(sum(Inew3(:,(size(illusions,2)/2):(size(illusions,2)))))/blobMeasurements(1).Area;
        
        v1 = [redSum1,greenSum1,blueSum1];
        v2 = [redSum2,greenSum2,blueSum2];

        Target1 = sum(sum(Ihsv(:,1:int8(size(illusions,2)/2))))/blobMeasurements(1).Area;
        Target2 = sum(sum(Ihsv(:,(size(illusions,2)/2):(size(illusions,2)))))/blobMeasurements(1).Area;
        
        angE = angularError(v1,v2);

        replication(i,1) = angE;
        replication(i,2) = Target1;
        replication(i,3) = Target2;
% 
%         imshow(BW)
%         figure
%         imshow(Inew1)
%         figure
%         imshow(toShow(:,:,1),[])
%         pause
%         close all



    end

end

function angE = angularError(v1,v2)

%angular_error=arc cos( (v1·v2) / (||v1|| ||v2||) ) 



        angE = acos(dot(v1,v2)/(norm(v1)*norm(v2)));



end
