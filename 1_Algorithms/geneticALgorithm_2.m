%% Parameters

sizeImages = 256;
targetSize = 3; % square size
targetPos = 128;
targetIntensity = 0.5;
population = 100;% Number of pair of images
mutationRate = 0.1;
generations =  10;
numBits = 4;


%% Cost Function

% Load resNet
%   net = resnet50;

maxScore = 0;

%% Data

chromosomes = rand(4,numBits,population*2);
chromosomes(chromosomes>=0.5) = 1;
chromosomes(chromosomes<0.5) = 0;
reproductionRates = [0.4*population 0.3*population 0.1*population 0.1*population 0.1*population];
reproductionIndices = zeros(population,1);
imageSet = makeLineImage(chromosomes);

% Put targets
imageSet(targetPos:targetPos+targetSize,targetPos:targetPos+targetSize,:,:) = targetIntensity;
Mask = checkerboard(2,64,64);
Mask(Mask>0)=1;

%Best Results
best = zeros(sizeImages,sizeImages,1,generations*2);
bestResponse = zeros(128,128,1,generations*2);
bestScore = zeros(generations,1);
bestParameters =  zeros(4,numBits,generations*2);



%% Main loop

for gen=1:generations
    
    ['Generation: ',num2str(gen),' Best replication: ',num2str(max(bestScore))]

    % 1. Eval fitness
     [score,sumConv1] = fitnessResNet50(cat(3, imageSet, imageSet,imageSet),net,targetPos,targetSize,chromosomes,population);

    % 2. Selection
    cont = 1;
    for i = 1:length(reproductionRates)

       [M,I] = max(abs(score));
    
       
       % Save best result form this generation
       if(i==1)
           best(:,:,1,gen)=imageSet(:,:,1,I);
           best(:,:,1,gen+generations)=imageSet(:,:,1,I+population);
           
           bestResponse(:,:,1,gen)=sumConv1(:,:,1,1,I);
           bestResponse(:,:,1,gen+generations)=sumConv1(:,:,1,1,I+population);
           bestParameters(:,:,gen) = chromosomes(:,:,I);
           bestParameters(:,:,gen+generations) = chromosomes(:,:,I+population);
%            bi2de(bestParameters(1,:,gen+generations))
%            bi2de(bestParameters(2,:,gen+generations))
           
           bestScore(gen)=M;
           
%            subplot(1,2,1)
%             imshow(best(:,:,1,gen),[])
%             subplot(1,2,2)
%             imshow(best(:,:,1,gen+generations),[])
%             pause
       end

       for j=1:reproductionRates(i)
           score(I) = 0;
           reproductionIndices(cont) = I;       
           cont = cont + 1;
       end
    end

    % 3. Offspring
    chromosomesOld = chromosomes;

    for i=1:population
        
        mask = zeros(1,numBits);
        crossPoint = randi([2 numBits],1);
        mask(1,crossPoint:end) =1;
        
        chromosomes(:,crossPoint:end,i) = chromosomesOld(:,crossPoint:end,reproductionIndices(i));
        chromosomes(:,1:crossPoint,i) = chromosomes(:,1:crossPoint,i);
        chromosomes(:,crossPoint:end,i+population) = chromosomesOld(:,crossPoint:end,reproductionIndices(i)+population);
        chromosomes(:,1:crossPoint,i+population) = chromosomes(:,1:crossPoint,i+population);

%         imageSet(:,:,1,i) = (imagesOld(:,:,1,reproductionIndices(i)).*Mask + imagesOld(:,:,1,i)).*not(Mask);
%         imageSet(:,:,1,i+100) = (imagesOld(:,:,1,reproductionIndices(i)+100).*Mask + imagesOld(:,:,1,i+100)).*not(Mask);


    end

    % 4. Mutation

    for i=1:int8(mutationRate*population)

       index = randi([1 population],1);
       feature = randi([1 numBits],1);
       bitt= randi([1 numBits],1);
       
       chromosomes(feature,bitt,index) = not(chromosomes(feature,bitt,index));
       chromosomes(feature,bitt,index+population) = not(chromosomes(feature,bitt,index));
%        
%        mutationMat = rand(sizeImages,sizeImages,1,1);
%        imageSet(:,:,1,index) = imageSet(:,:,1,index).*Mask + mutationMat.*not(Mask);
%        imageSet(:,:,1,index+100) = imageSet(:,:,1,index+100).*Mask + mutationMat.*not(Mask);


    end
    
    imageSet = makeLineImage(chromosomes);
    % Put targets
    imageSet(targetPos:targetPos+targetSize,targetPos:targetPos+targetSize,:,:) = targetIntensity;
%     max(max(max(max(imagesOld-images))))

end

"ENDDDD!!"


% Plot Best
[M,I] = max(abs(bestScore));
subplot(2,2,1)
imshow(best(:,:,1,I))
subplot(2,2,2)
imshow(best(:,:,1,I+generations))
subplot(2,2,3)
imshow(best(:,:,1,I),[])
subplot(2,2,4)
imshow(best(:,:,1,I+generations),[])

figure
subplot(2,2,1)
imshow(bestResponse(:,:,1,I),[])
subplot(2,2,2)
imshow(bestResponse(:,:,1,I+generations),[])
subplot(2,2,3)
plot(bestResponse(60:70,65,1,I))
hold on
plot(bestResponse(60:70,65,1,I+generations))
grid on

bi2de(bestParameters(1,:,I))%stepSize
bi2de(bestParameters(2,:,I))
bi2de(bestParameters(1,:,I+generations))
bi2de(bestParameters(2,:,I+generations))



 
 %%
 
 
%  stepSize2 = 15;
%  withGrid = 12;
% 
% 
% 
% %         stepSize = bi2de(chromosomeMatrix(1,:,i));
% %         withGrid = bi2de(chromosomeMatrix(2,:,i));
% %         barInt = bi2de(chromosomeMatrix(3,:,i));
% %         backgroundInt = bi2de(chromosomeMatrix(4,:,i));
%         barInt = 1;
%         backgroundInt = 0;
% 
%         image2 = ones(256,256)*backgroundInt;
% 
% 
%         [rows, columns, numberOfColorChannels] = size(image2);
%         % 
% %         for row=1:stepSize:rows
% % %             row
% %             image2(row:row+withGrid,:) = 1;
% %         end
% 
%         for col=1:stepSize2:columns
% 
%             image2(:,col:col+withGrid) = barInt;
% 
%         end
% 
% % 
%         imshow(image2,[])

  %%      
   function [score,sumConv1] = fitnessResNet50(image,net,targetPos,targetSize,chromosomes,population)

    % Forward pass throuht conv1
    act1 = activations(net,image,'conv1');    

    sz = size(act1);
    act1 = reshape(act1,[sz(1) sz(2) 1 sz(3) sz(4)]);


    % Sum all first layer outputs
    %sumConv1 = zeros(size(act1,1),size(act1,2),sz(4)) ;
    sumConv1 = sum(act1,4)/64;
%     
%     imshow(squeeze(sumConv1(:,:,1,1)),[])
%     pause
    
    light = squeeze(sumConv1(:,:,1,1:population));
    dark = squeeze(sumConv1(:,:,1,population+1:end));
    difference = abs(light) - abs(dark);
    targetResult = difference(64:66,64:66,:);
    score = squeeze(sum(sum(targetResult,1),2));
    

    
    
    stepSize = zeros(size(act1,5),1);
    widthGrid = zeros(size(act1,5),1);
    colorsbar = zeros(size(act1,5),1);
    colorsbackground = zeros(size(act1,5),1);
    
    for i=1:size(act1,5)
       
        stepSize(i)= bi2de(chromosomes(1,:,i));
        widthGrid(i) = bi2de(chromosomes(2,:,i));
        colorsbar(i) = bi2de(chromosomes(3,:,i));
        colorsbackground(i) = bi2de(chromosomes(4,:,i));
        
        if(colorsbackground(i)>8)
           
            colorsbackground(i) =1;
        
        else
            colorsbackground(i) =0;           
            
        end
        
        if(colorsbar(i)>8)
           
            colorsbar(i) =1;
        
        else
            colorsbar(i) =0;           
            
        end        
        
    end
    
    differenceParam = (stepSize-widthGrid);
    differenceParam0 = differenceParam(1:population);
    differenceParam1 = differenceParam(population+1:population*2);
    
    
    step1 = stepSize(1:population);
    step2 = stepSize(population+1:population*2);
    
    colorsbar1 = colorsbar(1:population);
    colorsbar2 = colorsbar(101:200);
    

%     colorsbackg1 = colorsbackground(1:population);
%     colorsbackg2 = colorsbackground(population+1:population*2);
%     colorDiff1 = abs(colorsbar1-colorsbackg1);
%     colorDiff2 = abs(colorsbar2-colorsbackg2);
% %     score(step1>30) = 0;
% %     score(step2>30) = 0;
%     score(step1<3) = 0;
%     score(step2<3) = 0;
% %     score(stepSize<3) = 0;
% %     score(widthGrid>20) = 0;
% %     score(widthGrid<3) = 0;
%     score(differenceParam0<3) = 0;
%     score(differenceParam1<3) = 0;
%     
%      score(colorDiff1<1) = 0;
%      score(colorDiff2<1) = 0;
  
    
  
%     for i=1:size(act1,5)
%         
%         sumConv1 = sum(act1,4)
% 
%     end
    
%     for i=size(act1,4):size(act1,4)*2-1
% 
% 
%         sumConv1 = sumConv1 + act2(:,:,1,i-size(act1,4)+1);
% 
%     end    

 end      
