% Execute this part first
% Load AlexNet
 net = alexnet;



%% White Illusion

pathImages = '/home/alexander/Desktop/CVPR/temp/matlabInput/';

posTargets = [17,45;9,23;20,43;10,22;24,52;12,26];

VerticalBars = [18,46;9,23;17,23;39,45;18,29;46,58];
VerticalBars2 = [8,13;20,25;8,13;20,25;9,15;23,29];
cont = 1;

for i=0:3
    
    close all
    
    % Load input image
    image0 = (imread([pathImages,num2str(i),'.png']));
    
    %image0=divisiveNormalization(image0);

    image1 = zeros(size(image0,1),size(image0,2),3);  
    


    sumConv1_1 = (forwardFirst(image0,net));
    sumConv1_2 = forwardSecond(image0,net);
    %sumConv1_1 = 1./(1 + exp(-(-9.119136810302734).*(sumConv1_1-289)));
    
    mimSum = min(min(sumConv1_1));
    mmaxSum = max(max(sumConv1_1));
    
    mimSum2 = min(min(sumConv1_2));
    mmaxSum2 = max(max(sumConv1_2));    
    
%     sumConv1_1(posTargets(cont,1),VerticalBars(cont,2):end)=0;
%     sumConv1_1(posTargets(cont,1),1:VerticalBars(cont,1))=0;
%     
%     sumConv1_1(posTargets(cont,2),VerticalBars(cont+1,2):end)=0;
%     sumConv1_1(posTargets(cont,2),1:VerticalBars(cont+1,1))=0;    
% 
%         
%     sumConv1_2(posTargets(cont+1,1),VerticalBars2(cont,2):end)=0;
%     sumConv1_2(posTargets(cont+1,1),1:VerticalBars2(cont,1))=0;
%     
%     sumConv1_2(posTargets(cont+1,2),VerticalBars2(cont+1,2):end)=0;
%     sumConv1_2(posTargets(cont+1,2),1:VerticalBars2(cont+1,1))=0;    
    
    plot(sumConv1_1(posTargets(cont,1),:))
%     hold on
%     line([VerticalBars(cont,1) VerticalBars(cont,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont,2) VerticalBars(cont,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,1) VerticalBars(cont+1,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,2) VerticalBars(cont+1,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
     hold on
    plot(sumConv1_1(posTargets(cont,2),:))
    grid on
    legend('Target 1','Target 2')
    title('First Layer')
    
    
    figure
    plot(sumConv1_2(posTargets(cont+1,1),:))
    hold on
    plot(sumConv1_2(posTargets(cont+1,2),:))
    grid on
    legend('Target 1','Target 2')
    title('Second Layer')    
%     hold on
%     line([VerticalBars2(cont,1) VerticalBars2(cont,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont,2) VerticalBars2(cont,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,1) VerticalBars2(cont+1,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,2) VerticalBars2(cont+1,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
    
    
    cont = cont+2;
%    
figure
     imshow(sumConv1_1,[3000,3500])
    figure
    imshow(sumConv1_2,[])
    figure
    imshow(image0,[])
    
     pause
%  
    
end

%% Dungeon Effect

pathImages = '/home/alexander/Desktop/CVPR/temp/matlabInput/';

posTargets = [31,31;16,16;31,31;16,16;34,34;17,17];

VerticalBars = [18,46;9,22;8,46;39,43;18,29;46,58];
VerticalBars2 = [9,22;20,25;9,22;20,25;9,15;23,29];
cont = 1;
i=3

while i<8
    
    close all
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    
    %image0=divisiveNormalization(image0);

   
    


    sumConv1_1 = (forwardFirst(image0,net));
    sumConv1_2 = forwardSecond(image0,net);
    

    sumConv2_1 = (forwardFirst(image1,net));
    sumConv2_2 = forwardSecond(image1,net);    
    
    %sumConv1_1 = 1./(1 + exp(-(-9.119136810302734).*(sumConv1_1-289)));
    
    mimSum = min(min(sumConv1_1));
    mmaxSum = max(max(sumConv1_1));
    
    mimSum2 = min(min(sumConv1_2));
    mmaxSum2 = max(max(sumConv1_2));    
    
    plot(sumConv1_1(posTargets(cont,1),:))
    hold on
    line([VerticalBars(cont,1) VerticalBars(cont,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars(cont,2) VerticalBars(cont,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,1) VerticalBars(cont+1,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,2) VerticalBars(cont+1,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    plot(sumConv2_1(posTargets(cont,2),:))
    grid on
    legend('Target 1','Target 2')
    title('First Layer')
    
    figure
    plot(sumConv1_2(posTargets(cont+1,1),:))
    hold on
    plot(sumConv2_2(posTargets(cont+1,2),:))
    grid on
    legend('Target 1','Target 2')
    title('Second Layer')    
    hold on
    line([VerticalBars2(cont,1) VerticalBars2(cont,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars2(cont,2) VerticalBars2(cont,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,1) VerticalBars2(cont+1,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,2) VerticalBars2(cont+1,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     
    
    cont = cont+2;
    i = i+2;
   
figure
     imshow(sumConv1_2,[])
    figure
    imshow(sumConv2_2,[])
    

%     act1 = activations(net,image0,'conv1','OutputAs','channels');
%     sz = size(act1);
%     act1 = reshape(act1,[sz(1) sz(2) 1 sz(3)]);

   

    
    pause
 
    
end


%% Chevreul effect

pathImages = '/home/alexander/Desktop/CVPR/temp/matlabInput/';

posTargets = [32,32;16,16;32,32;16,16;19,40;9,20];

VerticalBars = [17,22;43,48;17,23;39,45;18,29;46,58];
VerticalBars2 = [8,13;20,25;8,13;20,25;9,15;23,29];
cont = 1;


 
    close all
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(9),'.png']),[256,256]);
    
    %image0=divisiveNormalization(image0);

   
    


    sumConv1_1 = (forwardFirst(image0,net));
    sumConv1_2 = forwardSecond(image0,net);
    

    
    %sumConv1_1 = 1./(1 + exp(-(-9.119136810302734).*(sumConv1_1-289)));
    
    mimSum = min(min(sumConv1_1));
    mmaxSum = max(max(sumConv1_1));
    
    mimSum2 = min(min(sumConv1_2));
    mmaxSum2 = max(max(sumConv1_2));    
    
    plot(sumConv1_1(posTargets(cont,1),:))
    hold on
    line([VerticalBars(cont,1) VerticalBars(cont,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars(cont,2) VerticalBars(cont,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,1) VerticalBars(cont+1,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,2) VerticalBars(cont+1,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    grid on
    legend('Target 1','Target 2')
    title('First Layer')
    
    figure
    plot(sumConv1_2(posTargets(cont+1,1),:))
    grid on
    legend('Target 1','Target 2')
    title('Second Layer')    
    hold on
    line([VerticalBars2(cont,1) VerticalBars2(cont,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars2(cont,2) VerticalBars2(cont,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,1) VerticalBars2(cont+1,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,2) VerticalBars2(cont+1,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     
    
    cont = cont+2;
    i = i+2;
   
figure
     imshow(sumConv2_1,[])
    figure
    imshow(sumConv2_2,[])
    
    pause%  
    

%% Hong- Shevell

pathImages = '/home/alexander/Desktop/CVPR/temp/matlabInput/';

posTargets = [32,32;16,16;32,32;16,16;32,32;16,16];

VerticalBars = [18,46;9,22;8,46;39,43;18,29;46,58];
VerticalBars2 = [9,22;20,25;9,22;20,25;9,15;23,29];
cont = 1;
i=10

while i<16
    
    close all
    
    % Load input image
    image0 = imresize(imread([pathImages,num2str(i),'.png']),[256,256]);
    image1 = imresize(imread([pathImages,num2str(i+1),'.png']),[256,256]);
    
    %image0=divisiveNormalization(image0);

   
    


    sumConv1_1 = (forwardFirst(image0,net));
    sumConv1_2 = forwardSecond(image0,net);
    

    sumConv2_1 = (forwardFirst(image1,net));
    sumConv2_2 = forwardSecond(image1,net);    
    
    %sumConv1_1 = 1./(1 + exp(-(-9.119136810302734).*(sumConv1_1-289)));
    
    mimSum = min(min(sumConv1_1));
    mmaxSum = max(max(sumConv1_1));
    
    mimSum2 = min(min(sumConv1_2));
    mmaxSum2 = max(max(sumConv1_2));    
    
    plot(sumConv1_1(posTargets(cont,1),:))
    hold on
    line([VerticalBars(cont,1) VerticalBars(cont,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars(cont,2) VerticalBars(cont,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,1) VerticalBars(cont+1,1)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars(cont+1,2) VerticalBars(cont+1,2)],[mimSum mmaxSum],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    plot(sumConv2_1(posTargets(cont,2),:))
    grid on
    legend('Target 1','Target 2')
    title('First Layer')
    
    figure
    plot(sumConv1_2(posTargets(cont+1,1),:))
    hold on
    plot(sumConv2_2(posTargets(cont+1,2),:))
    grid on
    legend('Target 1','Target 2')
    title('Second Layer')    
    hold on
    line([VerticalBars2(cont,1) VerticalBars2(cont,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([VerticalBars2(cont,2) VerticalBars2(cont,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,1) VerticalBars2(cont+1,1)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     hold on
%     line([VerticalBars2(cont+1,2) VerticalBars2(cont+1,2)],[mimSum2 mmaxSum2],'LineWidth',1,'Color','yellow','LineStyle','-')
%     
    
    cont = cont+2;
    i = i+2;
   
figure
     imshow(sumConv2_1,[])
    figure
    imshow(image0,[])
    
    pause
 
    
end



