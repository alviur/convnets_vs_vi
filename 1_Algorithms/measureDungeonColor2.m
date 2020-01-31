


function replication = measureDungeonColor2(illusions)

%     pathMasks = '/home/alexander/Desktop/CVPR/temp/dungeonTargets/';
    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masksDungeon/';
    
    cont = 1;
    
%     numAreas =[13,9,6,4,4,3];
    numAreas =[13,8,6,5,4,3];
    
    i=1;
    
    replication = zeros(size(illusions,1),3);

     while i<size(illusions,1)

        temp = rgb2gray(imread([pathMasks,num2str(cont-1),'.png']));
        
        if(size(temp,3)>1)
        
            rawImage = rgb2gray(temp);
        
        else
            rawImage = temp;
        end
        
        
        
        
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');
        
        toShow1(:,:,1) = squeeze(illusions(i,:,:,3));
        toShow1(:,:,2) = squeeze(illusions(i,:,:,2));
        toShow1(:,:,3) = squeeze(illusions(i,:,:,1));

        hsv = rgb2hsv(toShow1);
        
        Inew1 = BW.*toShow1(:,:,1);
        Inew2 = BW.*toShow1(:,:,2);
        Inew3 = BW.*toShow1(:,:,3);
        Ihsv = BW.*hsv(:,:,1);        

        toShow2(:,:,1) = squeeze(illusions(i+1,:,:,3));
        toShow2(:,:,2) = squeeze(illusions(i+1,:,:,2));
        toShow2(:,:,3) = squeeze(illusions(i+1,:,:,1));

        hsv2 = rgb2hsv(toShow2);
        
        Inew1_2 = BW.*toShow2(:,:,1);
        Inew2_2 = BW.*toShow2(:,:,2);
        Inew3_2 = BW.*toShow2(:,:,3);
        Ihsv_2 = BW.*hsv2(:,:,1);         
        

        redSum1 = sum(sum(Inew1))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        redSum2 = sum(sum(Inew1_2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        
        greenSum1 = sum(sum(Inew2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        greenSum2 = sum(sum(Inew2_2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        
        blueSum1 = sum(sum(Inew3))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        blueSum2 = sum(sum(Inew3_2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        
        v1 = [redSum1,greenSum1,blueSum1];
        v2 = [redSum2,greenSum2,blueSum2];        
              
        

        angE = angularError(v1,v2);

        Target1 = sum(sum(Ihsv))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        Target2 = sum(sum(Ihsv_2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));        
        
        replication(cont,1) = angE;
        replication(cont,2) = Target1;
        replication(cont,3) = Target2;
             
        i = i+2;
        cont = cont + 1

%         imshow(rawImage)
%         figure
%         imshow(Inew1_2)
% %         figure
% %         imshow(Inew1)
%         pause
%         close all



    end

end

function angE = angularError(v1,v2)

%angular_error=arc cos( (v1·v2) / (||v1|| ||v2||) ) 



        angE = acos(dot(v1,v2)/(norm(v1)*norm(v2)));



end

