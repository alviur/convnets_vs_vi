    
    
function replication = measureLuminanceGray2(illusions)

%     pathMasks = '/home/alexander/Desktop/CVPR/temp/maskLuminance/';
    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/maskLum/';
    %posVect =[20,24,22;105,109,22;18,26,22;103,111,22;16,28,22;101,113,22;13,31,22;98,116,22;10,34,22;95,119,22];
    posVect =[41,45,43;212,216,43;39,47,43;210,218,43;37,49,43;208,220,43;35,51,43;206,222,43;33,53,43;204,224,43];
    replication = zeros(size(illusions,1),1);
    
    sizeTarget = [1,3,5,8,11,15];
    cont = 1;
    
    for i=1:size(illusions,1)

        rawImage = rgb2gray(imread([pathMasks,num2str(i-1),'.png']));
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');
        
        if(size(illusions(i,:,:,:),4)>1)
        
            temp1 = rgb2gray(squeeze(illusions(i,:,:,:)));
        
        else
            temp1 = (squeeze(illusions(i,:,:)));
        end
                      
        

        image2Eval = temp1;

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
        
        replication(i,1)=  Target1 -Target2;


        cont
        plot(Inew(posVect(cont,3),posVect(cont,1):posVect(cont,2)),'-o')
%         axis([1 inf 0 1])
        hold on
        plot(Inew(posVect(cont+1,3),posVect(cont+1,1):posVect(cont+1,2)),'-*')
%         axis([1 inf 0 1])
        grid on
        legend('Black Rounded','White rounded')
        title(['Luminance Gradient Target size ',num2str(sizeTarget(i))])
        saveas(gcf,['/home/alexander/Desktop/CVPR/temp/figs/LumnGray_r',num2str(sizeTarget(i)),'.png'])
 
        cont = cont+2;
% figure
%         imshow(Inew)
%         figure
%         imshow(image2Eval)
         pause
        close all



    end

end

