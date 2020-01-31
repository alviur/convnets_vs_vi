




%%



a = squeeze(illusions(1,:,:,:));
trueImg = imread('/home/alexander/Desktop/CVPR/2_Data/sup/1.jpg');

pathA = a(72:94,46:72,:);
pathB = a(12:36,102:128,:);

pathA2 = trueImg(72:94,46:72,:);
pathB2 = trueImg(12:36,102:128,:);


histogram(pathA(:,:,1))
hold on
histogram(pathB(:,:,1))
title('Blue channel')
grid on
legend('Bird on blue','Bird on yellow')

figure
histogram(pathA2(:,:,3))
hold on
histogram(pathB2(:,:,3))
title('Blue channel True')
grid on
legend('Bird on blue','Bird on yellow')


plot(trueImg(83,:,3));hold on;plot(trueImg(24,:,3))
plot(a(83,:,1));hold on;plot(a(24,:,1))


%%

a = rgb2gray(squeeze(illusions(2,:,:,:)));
trueImg = imread('/home/alexander/Desktop/CVPR/2_Data/sup/2.jpg');


plot(a(:,64))

%%

a = (squeeze(illusions(3,:,:,:)));
trueImg = double(imread('/home/alexander/Desktop/CVPR/2_Data/sup/3.jpg'))/255;

b = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);

histogram(b(:,:,3));hold on;histogram(trueImg(:,:,3))


%%

a = rgb2gray(squeeze(illusions(4,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/4.jpg')))/255;


plot(a(:,53));hold on;plot(trueImg(:,53))

%%

a = (squeeze(illusions(5,:,:,:)));
trueImg = double((imread('/home/alexander/Desktop/CVPR/2_Data/sup/5.jpg')))/255;

b = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);
%  imshow(b(54:65,43:56))
 
%  histogram(b(54:65,43:56,1));hold on;histogram(trueImg(54:65,43:56,1));title('Red')
%  figure
%   histogram(b(54:65,43:56,2));hold on;histogram(trueImg(54:65,43:56,2));title('Green')
%   figure 
%    histogram(b(54:65,43:56,3));hold on;histogram(trueImg(54:65,43:56,3));title('Blue')
 


imshow(b(54:65,43:56,:));figure;imshow(trueImg(54:65,43:56,:))

%%

a = (squeeze(illusions(6,:,:,:)));
trueImg = double((imread('/home/alexander/Desktop/CVPR/2_Data/sup/6.jpg')))/255;

b = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);


imshow(b)

%%

%%

a = (squeeze(illusions(8,:,:,:)));
trueImg = double((imread('/home/alexander/Desktop/CVPR/2_Data/sup/8.jpg')))/255;

b = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);


imshow(b)


imshow(trueImg)


%%
a = rgb2gray(squeeze(illusions(10,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/10.jpg')))/255;


plot(a(97,:))

%% Este
a = rgb2gray(squeeze(illusions(11,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/11.jpg')))/255;


plot(a(45,:));hold on;plot(a(82,:));grid on

%% 

a = rgb2gray(squeeze(illusions(14,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/11.jpg')))/255;


plot(a(:,64));hold on;plot(a(:,91));grid on

%%

a = (squeeze(illusions(15,:,:,:)));
trueImg = double((imread('/home/alexander/Desktop/CVPR/2_Data/sup/15.jpg')))/255;

b = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);


imshow(b)

%% Este

a = rgb2gray(squeeze(illusions(16,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/16.jpg')))/255;


plot(a(64,:));hold on;plot(trueImg(64,:));grid on



%% 

a = rgb2gray(squeeze(illusions(17,:,:,:)));
trueImg = double(rgb2gray(imread('/home/alexander/Desktop/CVPR/2_Data/sup/17.jpg')))/255;


plot(a(65,:));grid on

%%

a = (squeeze(illusions(18,:,:,:)));
a2 = (squeeze(illusions(19,:,:,:)));

b = zeros(128,128,3);
b2 = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);

b2(:,:,1) = a2(:,:,3);
b2(:,:,2) = a2(:,:,2);
b2(:,:,3) = a2(:,:,1);

plot(b(64,:,1));hold on;plot(b2(64,:,1))
figure
plot(b(64,:,2));hold on;plot(b2(64,:,2))
figure
plot(b(64,:,3));hold on;plot(b2(64,:,3))

%%


a = (squeeze(illusions(20,:,:,:)));
a2 = (squeeze(illusions(21,:,:,:)));

b = zeros(128,128,3);
b2 = zeros(128,128,3);
b(:,:,1) = a(:,:,3);
b(:,:,2) = a(:,:,2);
b(:,:,3) = a(:,:,1);

b2(:,:,1) = a2(:,:,3);
b2(:,:,2) = a2(:,:,2);
b2(:,:,3) = a2(:,:,1);

plot(b(64,:,1));hold on;plot(b2(64,:,1))
figure
plot(b(64,:,2));hold on;plot(b2(64,:,2))
figure
plot(b(64,:,3));hold on;plot(b2(64,:,3))