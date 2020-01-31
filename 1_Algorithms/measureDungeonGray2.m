


function replication = measureDungeonGray2(illusions,kernelSize,numKernels)

%     pathMasks = '/home/alexander/Desktop/CVPR/temp/dungeonTargets/';
    pathMasks = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masksDungeon/';
    
    cont = 1;
    
%     numAreas =[13,9,6,4,4,3];

%     posVect =[61,65,63;56,61,71;57,64,70;52,61,69;50,61,70;63,77,70];
    posVect =[123,129,126;121,131,139;114,127,138;123,139,131;103,127,145;127,153,139];
    numAreas =[13,8,6,5,4,3];
    sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15] ;
    
    i=1;
    
    replication = zeros(size(illusions,1)/2,1);

     while i<size(illusions,1)

        rawImage = rgb2gray(imread([pathMasks,num2str(cont-1),'.png']));
        level = graythresh(rawImage);
        BW = imbinarize(rawImage,level);
        
        labeledImage = bwlabel(BW, 8);
        blobMeasurements = regionprops(labeledImage, BW, 'all');
       
        size(illusions(i,:,:,:),4)
        if(size(illusions(i,:,:,:),4)>1)
        
            temp1 = rgb2gray(squeeze(illusions(i,:,:,:)));
            temp2 = rgb2gray(squeeze(illusions(i+1,:,:,:)));
        
        else
            temp1 = (squeeze(illusions(i,:,:)));
            temp2 = (squeeze(illusions(i+1,:,:)));
        end
                

        image2Eval1 = temp1;
        image2Eval2 = temp2;

        Inew1 = BW.*image2Eval1;
        Inew2 = BW.*image2Eval2;

        Target1 = sum(sum(Inew1))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        Target2 = sum(sum(Inew2))/(blobMeasurements(1).Area*numAreas(cont)*numAreas(cont));
        
        replication(cont,1)= Target2 -Target1
        
        i = i+2;
        
        posVect(cont,1)
        posVect(cont,2)
        
        plot(image2Eval1(posVect(cont,1):posVect(cont,2),posVect(cont,3)),'-o')
%         axis([1 inf 0 1])
        hold on
        plot(image2Eval2(posVect(cont,1):posVect(cont,2),posVect(cont,3)),'-*') 
%         axis([1 inf 0 1])
        grid on
        legend('Black Rounded','White rounded')
        title(['Dungeon Gray r',num2str(kernelSize),' nk',num2str(numKernels),' f',num2str(sparialFreqDun(cont))])
        saveas(gcf,['/home/alexander/Desktop/CVPR/temp/figs/DungeonGray_r',num2str(kernelSize),'_nk',num2str(numKernels),'_f',num2str(sparialFreqDun(cont)),'.png'])
 
        figure
        imshow(Inew1)
        figure
        imshow(Inew2)



        pause

        cont = cont + 1
        close all
        


    end

end
