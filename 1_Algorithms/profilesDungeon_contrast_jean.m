
%% Assimilation

img1 = rgb2gray(squeeze(illusions(10,:,:,:)));

img2 = rgb2gray(squeeze(illusions(11,:,:,:)));
% 
% img1 = (squeeze(illusions(59,:,:,2)));
% 
% img2 = (squeeze(illusions(60,:,:,2)));

% subplot(1,2,1)
% imshow(img1)
% subplot(1,2,2)
% imshow(img2)
figure
plot(squeeze(img1(63,:)))
hold on
plot(squeeze(img2(63,:)))
grid on
title('Dungeon f0.03')
legend('Black rounded','White rounded')
figure
imshow(img1)
   
% title('green')
% title('blue')
% title('Red')



%% Contrast

posDun = [19,24,22;105,110,22;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];

img1 = rgb2gray(squeeze(illusions(34,:,:,:)));
% img1 = rgb2gray(squeeze(illusions(85,:,:,:)));
imshow(img1)

cont = 1;

figure
plot((img1(posDun(cont,3),posDun(cont,1):posDun(cont,2))))
hold on
plot((img1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2))))
grid on     
    
title('Contrast f0.03')
legend('Black rounded','White rounded')

%%

img1 = (squeeze(illusions(82,:,:,1)));
plot(squeeze(img1(63,:)))
grid on
figure
imshow(squeeze(illusions(82,:,:,:)))

%%

    posDun = [19,42,23;64,87,83;18,26,22;104,111,22;17,27,22;103,112,22;16,28,22;102,113,22];

    img1 = (squeeze(illusions(85,:,:,1)));
%     
%     imshow(temp1)
%     pause
%     

    cont = 1;

    

    figure
    plot((img1(posDun(cont,1):posDun(cont,2),posDun(cont,3))))
    hold on
    plot((img1(posDun(cont+1,1):posDun(cont+1,2),posDun(cont+1,3))))
    grid on   
    
    figure
    imshow(img1)
    
    %%
    
    load('58.png.mat')
    a= im;
    load('59.png.mat')
    b= im;
    
    subplot(1,2,1)
    imshow(a)
    subplot(1,2,2)
    imshow(b)