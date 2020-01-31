


function replication = measureShevellGray2(illusions)

%     pathMasks = '/home/alexander/Desktop/CVPR/temp/dungeonTargets/';
    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masksShevell/';
    
    cont = 1;
    
    i=1;
    
    replication = zeros(size(illusions,1)/2,1);

     while i<size(illusions,1)

        rawImage = rgb2gray(imread([pathMasks,num2str(cont-1),'.png']));
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');

        image2Eval1 = rgb2gray(squeeze(illusions(i,:,:,:)));
        image2Eval2 = rgb2gray(squeeze(illusions(i+1,:,:,:)));

        Inew1 = BW.*image2Eval1;
        Inew2 = BW.*image2Eval2;

        Target1 = sum(sum(Inew1))/(blobMeasurements(1).Area);
        Target2 = sum(sum(Inew2))/(blobMeasurements(1).Area);
        
        replication(cont,1)= Target2 -Target1
        
        i = i+2;
        cont = cont + 1

        imshow(rawImage)
        figure
        imshow(image2Eval1)
%         figure
%         imshow(Inew1)
        pause
        close all



    end

end
