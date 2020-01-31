%% Parameters

sizeImages = 256;
targetSize = 3; % square size
targetPos = 128;
targetIntensity = 0.5;
population = 100;% Number of pair of images
mutationRate = 0.03;
generations =  50;


%% Cost Function

% Load resNet
 net = resnet50;

maxScore = 0;

%% Data

images = rand(sizeImages,sizeImages,1,population*2);
reproductionRates = [0.4*population 0.3*population 0.1*population 0.1*population 0.1*population];
reproductionIndices = zeros(population,1);

% Put targets
images(targetPos:targetPos+targetSize,targetPos:targetPos+targetSize,:,:) = targetIntensity;
Mask = checkerboard(2,64,64);
Mask(Mask>0)=1;

%Best Results
best = zeros(sizeImages,sizeImages,1,generations*2);
bestScore = zeros(generations,1);



%% Main loop

for gen=1:generations
    
    ['Generation: ',num2str(gen),' Best replication: ',num2str(max(bestScore))]

    % 1. Eval fitness
     score = fitnessResNet50(cat(3, images, images,images),net,targetPos,targetSize);

    % 2. Selection
    cont = 1;
    for i = 1:length(reproductionRates)

       [M,I] = max(abs(score));
    
       
       % Save best result form this generation
       if(i==1)
           best(:,:,1,gen)=images(:,:,1,I);
           best(:,:,1,gen+generations)=images(:,:,1,I+100);
           bestScore(gen)=M;
       end

       for j=1:reproductionRates(i)
           score(I) = 0;
           reproductionIndices(cont) = I;       
           cont = cont + 1;
       end
    end

    % 3. Offspring
    imagesOld = images;

    for i=1:population

        images(:,:,1,i) = (imagesOld(:,:,1,reproductionIndices(i)).*Mask + imagesOld(:,:,1,i)).*not(Mask);
        images(:,:,1,i+100) = (imagesOld(:,:,1,reproductionIndices(i)+100).*Mask + imagesOld(:,:,1,i+100)).*not(Mask);


    end

    % 4. Mutation

    for i=1:int8(mutationRate*population)

       index = randi([1 100],1);
       mutationMat = rand(sizeImages,sizeImages,1,1);
       images(:,:,1,index) = images(:,:,1,index).*Mask + mutationMat.*not(Mask);
       images(:,:,1,index+100) = images(:,:,1,index+100).*Mask + mutationMat.*not(Mask);


    end
    
    % Put targets
    images(targetPos:targetPos+targetSize,targetPos:targetPos+targetSize,:,:) = targetIntensity;
%     max(max(max(max(imagesOld-images))))

end




% Plot Best
[M,I] = max(abs(bestScore));
subplot(1,2,1)
imshow(best(:,:,1,I),[])
subplot(1,2,2)
imshow(best(:,:,1,I+generations),[])


 function score = fitnessResNet50(image,net,targetPos,targetSize)

    % Forward pass throuht conv1
    act1 = activations(net,image,'conv1');    

    sz = size(act1);
    act1 = reshape(act1,[sz(1) sz(2) 1 sz(3) sz(4)]);


    % Sum all first layer outputs
    %sumConv1 = zeros(size(act1,1),size(act1,2),sz(4)) ;
    sumConv1 = sum(act1,4)/64;
    
    light = squeeze(sumConv1(:,:,1,1:100));
    dark = squeeze(sumConv1(:,:,1,101:end));
    difference = light - dark;
    targetResult = difference(targetPos/2:targetPos/2+targetSize,targetPos/2:targetPos/2+targetSize,:);
    score = squeeze(sum(sum(targetResult,1),2));
  
    
  
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
