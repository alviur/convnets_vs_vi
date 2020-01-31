function sumConv1 = forwardFirstvgg(image,net)

    % Resize image to input network size 256x256
    im = imresize(image,[256 256]);

    % Forward pass throuht conv1
    act1 = activations(net,im,'conv2_1','OutputAs','channels');
    act2 = activations(net,im,'conv1_2','OutputAs','channels');

    sz = size(act1);
    act1 = reshape(act1,[sz(1) sz(2) 1 sz(3)]);


    % Sum all first layer outputs
    sumConv1 = zeros(size(act1,1),size(act1,2)) ;
    for i=1:size(act1,4)

        sumConv1 = sumConv1 + act1(:,:,1,i);

    end
    
%     for i=size(act1,4):size(act1,4)*2-1
% 
% 
%         sumConv1 = sumConv1 + act2(:,:,1,i-size(act1,4)+1);
% 
%     end    

end
