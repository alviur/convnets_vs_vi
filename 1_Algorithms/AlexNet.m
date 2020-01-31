% Execute this part first
% Load AlexNet
net = alexnet;


%% Dungeon

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
% 
 posDun = [31,33,33,32,35,34];

 i=7;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirst(image0,net))/96;

    
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    sumConv1_2 = (forwardFirst(image1,net))/96;    %image0=divisiveNormalization(image0);
    
    plot((sumConv1_1(posDun(cont),:)))
    hold on
    plot(((sumConv1_2(posDun(cont),:))))
    grid on
    title('Dungeon f0.03')
    legend('Black rounded','White rounded')
    
    

    %sumConv1_2 = forwardSecond(image0,net);
    figure
    subplot(1,2,1)
    imshow(image0,[])
    subplot(1,2,2)
    imshow(image1,[])
    pause
    close all
    i = i+2;
    cont = cont + 1;
 
    
end

%% LumGradient

pathImages = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/';
posDun = [8,12,10;51,55,10;8,13,10;50,56,10;7,13,10;50,56,10;7,14,10;50,57,10;6,14,10;49,57,10];
figuresPath = '/home/alexander/Desktop/CVPR/5_figures/';
 i=33;
 
 cont = 1;
 
while i<39
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    sumConv1_1 = (forwardFirst(image0,net))/96;


    
    plot(((sumConv1_1(posDun(cont,3),posDun(cont,1):posDun(cont,2)))+11.06)/(18.3005+11.06),'Color','m','LineWidth',0.8)
    grid on
    ylim([0, 1])
    figure
    plot(((sumConv1_1(posDun(cont,3),posDun(cont+1,1):posDun(cont+1,2)))+11.06)/(18.3005+11.06),'Color','c','LineWidth',0.8)
    grid on
   
%     
%     
% 
%     %sumConv1_2 = forwardSecond(image0,net);
%     figure
%     imshow(sumConv1_1,[])
    
    ylim([0, 1])
    % set(gca,'xtick',[])
    set(gca,'xticklabel',[],'ytickLabel',[])
    set(gca,'LooseInset',get(gca,'TightInset'))
    saveas(gcf,[figuresPath,'lumAlex_g.svg'],'svg')

    
    
    
    pause
    close all
    i = i+1;
    cont = cont + 2;
 
    
end

%%

image0 = imresize(imread([pathImages,num2str(0),'.png']),[256,256]);
sumConv1_1 = (forwardFirst(image0,net))/64;
plot(sumConv1_1(32,:))
grid on
figure
imshow(sumConv1_1,[])