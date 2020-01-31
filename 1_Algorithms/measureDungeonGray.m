% 
% 
% height = [0.40,0.4,0.40,0.39,0.45,0.45,0.4];
% posxTarget = [63,64,64,63,63,69,65];
% 
% 
% 
% outputSize = 128;
% sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15] ;
% sparialFreqDun2 = [0.01,0.03,0.05,0.07,0.09,0.12] ;
% 
% kernelSize = 3;
%         
% masks = zeros(length(sparialFreqDun),outputSize,outputSize,3,2);
% 
% for i=1:length(sparialFreqDun)
%  
%     spatialFreq = i;
%     pos = spatialFreq;    
%     
%     withGrid = round(round(sparialFreqDun2(spatialFreq)*outputSize)/3);
%     stepSize = round(sparialFreqDun(spatialFreq)*outputSize);
% 
%     image = zeros(outputSize,outputSize,3);
%     imageMask = ones(outputSize,outputSize,3);
%     [rows, columns, numberOfColorChannels] = size(image);
%     darkInducerR = 1;
%     darkInducerG = 1;
%     darkInducerB = 1;
% 
%     targetR = 0;
%     targetG = 0;
%     targetB = 0;
% 
%     heightPix = round((height(pos)*outputSize)/2);
% 
%     % Target 
%     imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,1) = targetR;
%     imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,2) = targetG;
%     imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,3) = targetB;
% 
% 
%     for row=1:stepSize:rows
% 
%         image(row:row+withGrid,:, 1) = darkInducerR;
%         image(row:row+withGrid,:, 2) = darkInducerG;
%         image(row:row+withGrid,:, 3) = darkInducerB;    
% 
%     end
% 
% 
%     for col=1:stepSize:columns
% 
%         image(:,col:col+withGrid, 1) = darkInducerR;
%         image(:,col:col+withGrid, 2) = darkInducerG;
%         image(:,col:col+withGrid, 3) = darkInducerB;    
% 
%     end
% 
%      masks(i,:,:,:,1)=(image(1:128,1:128,:)-imageMask);
%      masks(i,:,:,2,1) = 0;
%      masks(i,:,:,3,1) = 0;
%      masks(i,:,:,:,2) = imageMask;
%      masks(i,:,:,2,2) = 1;
%      masks(i,:,:,3,2) = 1;
% %     imshow(squeeze(masks(i,:,:,:,1)))
% %     pause
% 
% end
% 
% target = [3,4,6,8,10,13]
% % grid = [1,2,3,4,5,6]
% 
% i=8
% 
% sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  
% contName = 1
% 
% close all
% 
% while i<19
%    
%        
%     
%     image2show = squeeze(illusions(i,:,:,:));
%     
%     mask2Apply = not(logical(squeeze(masks(contName,:,:,:,1))))-(logical(squeeze(masks(contName,:,:,:,2))));
%     
% %     image2show(logical(mask2Apply))=1;
%     
%     threshold = 0.5;
%     
%     r = image2show(:,:,1);
%     g = image2show(:,:,2);
%     b = image2show(:,:,3); 
%     
%     r(mask2Apply(:,:,1)<threshold) = 0;
%     r(mask2Apply(:,:,1)>threshold) = 1;
% %     g(mask2Apply(:,:,1)<threshold) = 0;
% %     b(mask2Apply(:,:,1)<threshold) = 0;
%     
%     
%     image2show(:,:,1) = r;
%     image2show(:,:,2) = g;
%     image2show(:,:,3) = b;   
%     
%     labeledImage = bwlabel(logical(image2show(:,:,1)), 8);
%     blobMeasurements = regionprops(labeledImage, logical(image2show(:,:,1)), 'all');
%     numberOfBlobs = size(blobMeasurements, 1);
%     
%     
%     if(int8(target(contName)/2)-int8(kernelSize/2)>0)
%             reduction = int8(target(contName)/2)-int8(kernelSize/2);
%         else
% 
%             reduction = 0;
% 
%     end 
%     
%     reducedImage = zeros(128,128);
%     
%     for blob=1:length(blobMeasurements)
%         
%         position = int8(blobMeasurements(blob).Centroid)
%         
%         int8(target(contName)/2)-int8(kernelSize/2)
%         
%         if(int8(target(contName)/2)-int8(kernelSize/2)>1)
%        
%             reducedImage(position(1)-int8(target(contName)/2)+reduction:position(1)+int8(target(contName)/2)-reduction,...
%                 position(2)-int8(target(contName)/2)+reduction:position(2)+int8(target(contName)/2)-reduction) = 1;
%         else
%             
%             reducedImage(position(1):position(1),position(2):position(2)) = 1;
%             
%         end
%         
%     end
%     
%     mask2Apply(:,:,1) = mask2Apply(:,:,1) - reducedImage;
%     
% 
% %     image2show(:,:,1) = image2show(:,:,1) + mask2Apply(:,:,1);
% %     image2show(:,:,2) = image2show(:,:,2) - mask2Apply(:,:,1);
% %     image2show(:,:,3) = image2show(:,:,3) - mask2Apply(:,:,1);
%     
% 
%     imshow(image2show,[])
%     figure 
%     imshow(squeeze(mask2Apply),[])
%     figure 
%     imshow(squeeze(illusions(i,:,:,:)),[])
%     figure
%     imshow(reducedImage,[])
%     
%     pause
%     close all
% 
%     
%     close all
%     i = i+2
%     contName = contName+1
%     
% end


function [replication,totalNoK]=measureDungeonGray(illusions,kernelSize)


    replication = zeros(int8(size(illusions,1)/2),1);

    totalNoK = zeros(int8(size(illusions,1)/2),1);

    height = [0.40,0.4,0.40,0.39,0.45,0.45,0.4];
    posxTarget = [63,64,64,63,63,69,65];



    outputSize = 128;
    sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15] ;
    sparialFreqDun2 = [0.01,0.03,0.05,0.07,0.09,0.12] ;

    %kernelSize = 3;

    masks = zeros(length(sparialFreqDun),outputSize,outputSize,3,2);

    for i=1:length(sparialFreqDun)

        spatialFreq = i;
        pos = spatialFreq;    

        withGrid = round(round(sparialFreqDun2(spatialFreq)*outputSize)/3);
        stepSize = round(sparialFreqDun(spatialFreq)*outputSize);

        image = zeros(outputSize,outputSize,3);
        imageMask = ones(outputSize,outputSize,3);
        [rows, columns, numberOfColorChannels] = size(image);
        darkInducerR = 1;
        darkInducerG = 1;
        darkInducerB = 1;

        targetR = 0;
        targetG = 0;
        targetB = 0;

        heightPix = round((height(pos)*outputSize)/2);

        % Target 
        imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,1) = targetR;
        imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,2) = targetG;
        imageMask(posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,posxTarget(pos)-heightPix:posxTarget(pos)+heightPix,3) = targetB;


        for row=1:stepSize:rows

            image(row:row+withGrid,:, 1) = darkInducerR;
            image(row:row+withGrid,:, 2) = darkInducerG;
            image(row:row+withGrid,:, 3) = darkInducerB;    

        end


        for col=1:stepSize:columns

            image(:,col:col+withGrid, 1) = darkInducerR;
            image(:,col:col+withGrid, 2) = darkInducerG;
            image(:,col:col+withGrid, 3) = darkInducerB;    

        end

         masks(i,:,:,:,1)=(image(1:128,1:128,:)-imageMask);
         masks(i,:,:,2,1) = 0;
         masks(i,:,:,3,1) = 0;
         masks(i,:,:,:,2) = imageMask;
         masks(i,:,:,2,2) = 1;
         masks(i,:,:,3,2) = 1;
    %     imshow(squeeze(masks(i,:,:,:,1)))
    %     pause

    end

    target = [3,4,6,8,10,13];
    % grid = [1,2,3,4,5,6]

    i=1;

    sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  ;
    contName = 1;

    

    while i< size(illusions,1)



        image2show = squeeze(illusions(i,:,:,:));
        
        targetImage = squeeze(illusions(i,:,:,:));
        targetImage2 = squeeze(illusions(i+1,:,:,:));

        mask2Apply = not(logical(squeeze(masks(contName,:,:,:,1))))-(logical(squeeze(masks(contName,:,:,:,2))));

    %     image2show(logical(mask2Apply))=1;

        threshold = 0.5;

        r = image2show(:,:,1);
        g = image2show(:,:,2);
        b = image2show(:,:,3); 

        r(mask2Apply(:,:,1)<threshold) = 0;
        r(mask2Apply(:,:,1)>threshold) = 1;
    %     g(mask2Apply(:,:,1)<threshold) = 0;
    %     b(mask2Apply(:,:,1)<threshold) = 0;


        image2show(:,:,1) = r;
        image2show(:,:,2) = g;
        image2show(:,:,3) = b;   

        labeledImage = bwlabel(logical(image2show(:,:,1)), 8);
        blobMeasurements = regionprops(labeledImage, logical(image2show(:,:,1)), 'all');
        numberOfBlobs = size(blobMeasurements, 1);


        if(int8(target(contName)/2)-int8(kernelSize/2)>0)
                reduction = int8(target(contName)/2)-int8(kernelSize/2);
            else

                reduction = 0;

        end 

        reducedImage = zeros(128,128);
        
        mean1 = 0;
        mean2 = 0;
        
        total1 = 0;
        total2 = 0;

        for blob=1:length(blobMeasurements)

            position = int8(blobMeasurements(blob).Centroid);
            
            box = blobMeasurements(blob).BoundingBox;
            
            total1 = total1+mean(mean(mean(targetImage(box(1):box(1)+box(3),box(2):box(2)+box(4),3))));
            total2 = total2+mean(mean(mean(targetImage2(box(1):box(1)+box(3),box(2):box(2)+box(4),3))));


            if(int8(target(contName)/2)-int8(kernelSize/2)>1)

                reducedImage(position(1)-int8(target(contName)/2)+reduction:position(1)+int8(target(contName)/2)-reduction,...
                    position(2)-int8(target(contName)/2)+reduction:position(2)+int8(target(contName)/2)-reduction) = 1;
                
                
                mean1 = mean1+mean(mean(mean(targetImage(position(1)-int8(target(contName)/2)+reduction:position(1)+int8(target(contName)/2)-reduction,...
                    position(2)-int8(target(contName)/2)+reduction:position(2)+int8(target(contName)/2)-reduction,:))));
                
                mean2 = mean2+ mean(mean(mean(targetImage2(position(1)-int8(target(contName)/2)+reduction:position(1)+int8(target(contName)/2)-reduction,...
                    position(2)-int8(target(contName)/2)+reduction:position(2)+int8(target(contName)/2)-reduction,:))));
                
                
            else

                reducedImage(position(1):position(1),position(2):position(2)) = 1;
                
                mean1 = mean1+ (mean(targetImage(position(1):position(1),position(2):position(2))));
                mean2 = mean2+ (mean(targetImage2(position(1):position(1),position(2):position(2))));
                
                

            end

        end
        
        mean1 = mean1/length(blobMeasurements);
        mean2 = mean2/length(blobMeasurements);
        total1 = total1/length(blobMeasurements);
        total2 = total2/length(blobMeasurements);
       
        

        mask2Apply(:,:,1) = mask2Apply(:,:,1) - reducedImage;


    %     image2show(:,:,1) = image2show(:,:,1) + mask2Apply(:,:,1);
    %     image2show(:,:,2) = image2show(:,:,2) - mask2Apply(:,:,1);
    %     image2show(:,:,3) = image2show(:,:,3) - mask2Apply(:,:,1);


%         imshow(image2show,[])
%         figure 
%         imshow(squeeze(mask2Apply),[])
%         figure 
%         imshow(squeeze(illusions(i,:,:,:)),[])
%         figure
%         imshow(reducedImage,[])

%         pause
%         close all

% 
%         close all
        i = i+2;
        
        
%         mean1 = (mean1(1,1,1)+mean1(1,1,2)+mean1(1,1,3)/3);
%         mean2 = (mean2(1,1,1)+mean2(1,1,2)+mean2(1,1,3)/3);
        
        replication(contName,1) =  squeeze(mean2)-squeeze(mean1);
        
        totalNoK(contName,1) =  total2-total1;
        
        
        contName = contName+1;
        
        

    end
    
    

end
