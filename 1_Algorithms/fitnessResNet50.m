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