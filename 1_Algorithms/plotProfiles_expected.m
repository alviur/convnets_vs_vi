


%% Whites illusion

sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15]

for i=1:7
    
    gray = (illusions(i,64,:,1)+illusions(i,64,:,2)+illusions(i,64,:,3))/3
    grayInput = (illusionsInput(i,64,:,1)+illusionsInput(i,64,:,2)+illusionsInput(i,64,:,3))/3
   
    subplot(1,3,1)
    imshow(squeeze(illusions(i,:,:,:)),[])
    title('Output image')
    subplot(1,3,2)
    plot(squeeze(gray))
    title('ConvNet output profile')
    grid on
    subplot(1,3,3)
    plot(squeeze(grayInput))
    title('ConvNet input profile)')
    grid on
    suptitle(['Whites illusion at ',num2str(sparialFreq(i))])
    pause
    
end

%% Dungeon
i=8

sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  
contName = 1

while i<19
    
    porVert =64
    if(i>=10)
        porVert =60
    end
    
    if(i==18)
        porVert =69
    end        
    
    gray = (illusions(i,porVert,:,1)+illusions(i,porVert,:,2)+illusions(i,porVert,:,3))/3
    gray2 = (illusions(i+1,porVert,:,1)+illusions(i+1,porVert,:,2)+illusions(i+1,porVert,:,3))/3

    grayInput = (illusionsInput(i,porVert,:,1)+illusionsInput(i,porVert,:,2)+illusionsInput(i,porVert,:,3))/3
    gray2Input = (illusionsInput(i+1,porVert,:,1)+illusionsInput(i+1,porVert,:,2)+illusionsInput(i+1,porVert,:,3))/3
    
    subplot(2,2,1)
    imshow(squeeze(illusions(i,:,:,:)),[])
    title('White output')
    subplot(2,2,2)
    imshow(squeeze(illusions(i+1,:,:,:)),[])
    title('Dark output')
    subplot(2,2,3)
    plot(squeeze(gray))
    hold on
    plot(squeeze(gray2))
    title('Profiles')
    grid on
    legend('White','Dark')
    subplot(2,2,4)
    plot(squeeze(grayInput))
    hold on
    plot(squeeze(gray2Input))
    title('ConvNet input profile)')
    grid on    
    suptitle(['Dungeon illusion at ',num2str(sparialFreqDun(contName))])
    pause
    
    close all
    i = i+2
    contName = contName+1
    
end

%% Chevreul Illusion and cancellation

i=20
heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7]
contTarg = 1

while i<27
    
    gray = (illusions(i,64,:,1)+illusions(i,64,:,2)+illusions(i,64,:,3))/3
    gray2 = (illusions(i+7,64,:,1)+illusions(i+7,64,:,2)+illusions(i+7,64,:,3))/3
    grayInputs = (illusionsInput(i,64,:,1)+illusionsInput(i,64,:,2)+illusionsInput(i,64,:,3))/3
    gray2Inputs = (illusionsInput(i+7,64,:,1)+illusionsInput(i+7,64,:,2)+illusionsInput(i+7,64,:,3))/3
    
    subplot(2,3,1)
    imshow(squeeze(illusions(i,:,:,:)),[])
    title('Output')
    subplot(2,3,2)
    plot(squeeze(gray))
    title('Profile')
    grid on
    subplot(2,3,4)
    imshow(squeeze(illusions(i+7,:,:,:)),[])
    title('Cancellation Output')
    subplot(2,3,5)
    plot(squeeze(gray2)) 
    title('Profile Cancellation')
    grid on
    subplot(2,3,3)
    plot(squeeze(grayInputs))
    title('ConvNet input profile')
    grid on
    subplot(2,3,6)
    plot(squeeze(gray2Inputs))
    title('ConvNet input profile')
    grid on
    suptitle(['Chevreul Illusion with target size ',num2str(int8(heightC(contTarg)*128))])
    pause
    i = i+1
    contTarg = contTarg+1
    
end

%% Luminance gradient

i = 34
sizeTarget = [3,5,8,11,15,18]
contTarg = 1
while i<40
    
    gray = (illusions(i,22,:,1)+illusions(i,22,:,2)+illusions(i,22,:,3))/3    
    gray2 = (illusions(i,64,:,1)+illusions(i,64,:,2)+illusions(i,64,:,3))/3

    grayInput = (illusionsInput(i,22,:,1)+illusionsInput(i,22,:,2)+illusionsInput(i,22,:,3))/3    
    gray2Input = (illusionsInput(i,64,:,1)+illusionsInput(i,64,:,2)+illusionsInput(i,64,:,3))/3    
    
    subplot(1,3,1)
    imshow(squeeze(illusions(i,:,:,:)),[])
    title('Output')
    subplot(1,3,2)
    plot(squeeze(gray))
    hold on
    plot(squeeze(gray2))
    title('Profiles')
    grid on
    subplot(1,3,3)
    plot(squeeze(grayInput))
    hold on
    plot(squeeze(gray2Input))
    title('ConvNet input profile')
    grid on
    suptitle(['Luminance gradient with target size ',num2str(int8(sizeTarget(contTarg)))])
    pause   
    i = i+1
    contTarg = contTarg+1
    close all
    
    
end

%% Hong-Shevell Rings

i=40
sparialFreq = [0.03,0.05,0.07,0.09,0.12,0.15]
contTarg = 1
while i<52
    
    porVert =64

    
    gray = (illusions(i,porVert,:,1)+illusions(i,porVert,:,2)+illusions(i,porVert,:,3))/3
    gray2 = (illusions(i+1,porVert,:,1)+illusions(i+1,porVert,:,2)+illusions(i+1,porVert,:,3))/3

    grayInput = (illusionsInput(i,porVert,:,1)+illusionsInput(i,porVert,:,2)+illusionsInput(i,porVert,:,3))/3
    grayInput2 = (illusionsInput(i+1,porVert,:,1)+illusionsInput(i+1,porVert,:,2)+illusionsInput(i+1,porVert,:,3))/3    
    
    subplot(2,2,1)
    imshow(squeeze(illusions(i,:,:,:)),[])
    title('White output')
    subplot(2,2,2)
    imshow(squeeze(illusions(i+1,:,:,:)),[])
    title('Dark output')
    subplot(2,2,3)
    plot(squeeze(gray))
    hold on
    plot(squeeze(gray2))
    title('Profiles')
    grid on
    subplot(2,2,4)
    plot(squeeze(grayInput))
    hold on
    plot(squeeze(grayInput2))
    title('ConvNet input profile')
    grid on
    
    suptitle(['Hong-Shevell Rings at  ',num2str((sparialFreq(contTarg)))])
    pause
    close all
    i = i+2
    contTarg = contTarg+1
    
end

%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%  COLOR %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Whites illusion

sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15];
contTarg = 1
toShow = zeros(128,128,3);

targetPos = [41,92;34,86;39,81;41,86;30,90;38,83;48,105];
pixelSize = int8(128*sparialFreq);
meanSize = [0,1,1,2,4,5,7];
for i=52:58
    
    toShow(:,:,1) = squeeze(illusions(i,:,:,3));
    toShow(:,:,2) = squeeze(illusions(i,:,:,2));
    toShow(:,:,3) = squeeze(illusions(i,:,:,1));
   
    mean1Blue = mean(illusions(i,64,targetPos(contTarg,1)-meanSize(contTarg):...
        targetPos(contTarg,1)+meanSize(contTarg),1));
    mean2Blue = mean(illusions(i,64,targetPos(contTarg,2)-meanSize(contTarg):...
        targetPos(contTarg,2)+meanSize(contTarg),1));
    
    mean1Green = mean(illusions(i,64,targetPos(contTarg,1)-meanSize(contTarg):...
        targetPos(contTarg,1)+meanSize(contTarg),2));    
    mean2Green = mean(illusions(i,64,targetPos(contTarg,2)-meanSize(contTarg):...
        targetPos(contTarg,2)+meanSize(contTarg),2));  
    
    mean1Red = mean(illusions(i,64,targetPos(contTarg,1)-meanSize(contTarg):...
        targetPos(contTarg,1)+meanSize(contTarg),3)); 
    mean2Red = mean(illusions(i,64,targetPos(contTarg,2)-meanSize(contTarg):...
        targetPos(contTarg,2)+meanSize(contTarg),3)); 
    
    subplot(2,3,1)
    imshow(toShow,[])
    title('Output image')
    subplot(2,3,2)
    plot(squeeze(illusions(i,64,:,1)),'b')
    hold on
    plot(squeeze(illusions(i,64,:,2)),'g')
    hold on
    plot(squeeze(illusions(i,64,:,3)),'r')
    title('Profile')
    grid on
    subplot(2,3,3)
    plot(squeeze(illusions(i,64,:,1)),'b')
    hold on
    %plot(mean1Blue)
    line([0 128],[mean1Blue mean1Blue],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([0 128],[mean2Blue mean2Blue],'LineWidth',1,'Color','magenta','LineStyle','-')
    legend('Target response',' Left target mean',' Right target mean')
    title('Profile Blue')
    grid on
    subplot(2,3,4)
    plot(squeeze(illusions(i,64,:,2)),'g')
    hold on
    line([0 128],[mean1Green mean1Green],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([0 128],[mean2Green mean2Green],'LineWidth',1,'Color','magenta','LineStyle','-')
    
    title('Profile Green')
    grid on
    subplot(2,3,5)
    plot(squeeze(illusions(i,64,:,3)),'r')
    hold on
    line([0 128],[mean1Red mean1Red],'LineWidth',1,'Color','yellow','LineStyle','-')
    hold on
    line([0 128],[mean2Red mean2Red],'LineWidth',1,'Color','magenta','LineStyle','-')
    
    title('Profile Red')
    grid on
    suptitle(['Whites illusion at ',num2str(sparialFreq(contTarg))])
    
    % Lines
    
    pause
    contTarg = contTarg+ 1;
    
end

%% Dungeon
i=59

sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  
contName = 1
toShow = zeros(128,128,3);
toShow2 = zeros(128,128,3);

while i<70
     
    toShow(:,:,1) = squeeze(illusions(i,:,:,3));
    toShow(:,:,2) = squeeze(illusions(i,:,:,2));
    toShow(:,:,3) = squeeze(illusions(i,:,:,1));
    
    toShow2(:,:,1) = squeeze(illusions(i+1,:,:,3));
    toShow2(:,:,2) = squeeze(illusions(i+1,:,:,2));
    toShow2(:,:,3) = squeeze(illusions(i+1,:,:,1));    
    

    porVert =64
    if(i>=61)
        porVert =60
    end
    
    if(i==69)
        porVert =69
    end       
  
   
    subplot(2,3,1)
    imshow(toShow,[])
    title('White output')
    subplot(2,3,2)
    imshow(toShow2,[])
    title('Dark output')
    subplot(2,3,3)
    plot(squeeze(illusions(i,porVert,:,1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,porVert,:,2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,porVert,:,3)),'Color','r','LineStyle','-')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,1)),'Color','b','LineStyle',':')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,2)),'Color','g','LineStyle',':')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,3)),'Color','r','LineStyle',':')
    title('Profiles')
    grid on
    subplot(2,3,4)
    plot(squeeze(illusions(i,porVert,:,1)),'b')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,1)),'k')
    grid on
    title('Profile Blue')
    subplot(2,3,5)
    plot(squeeze(illusions(i,porVert,:,2)),'g')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,2)),'k')
    grid on
    title('Profile Green')
    subplot(2,3,6)
    plot(squeeze(illusions(i,porVert,:,3)),'r')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,3)),'k')
    grid on
    title('Profile Red')
    %legend('White','Dark')
    suptitle(['Dungeon illusion at ',num2str(sparialFreqDun(contName))])
    pause
    
    close all
    i = i+2
    contName = contName+1
    
end

%% Chevreul Illusion and cancellation

i=71
heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7]
contTarg = 1

while i<77

    toShow(:,:,1) = squeeze(illusions(i,:,:,3));
    toShow(:,:,2) = squeeze(illusions(i,:,:,2));
    toShow(:,:,3) = squeeze(illusions(i,:,:,1));
    
    toShow2(:,:,1) = squeeze(illusions(i+7,:,:,3));
    toShow2(:,:,2) = squeeze(illusions(i+7,:,:,2));
    toShow2(:,:,3) = squeeze(illusions(i+7,:,:,1));     
    

   
    subplot(2,2,1)
    imshow(toShow,[])
    title('Output')
    subplot(2,2,2)
    plot(squeeze(illusions(i,64,:,1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,64,:,2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,64,:,3)),'Color','r','LineStyle','-')
    title('Profile')
    grid on
    subplot(2,2,3)
    imshow(toShow2,[])
    title('Cancellation Output')
    subplot(2,2,4)
    plot(squeeze(illusions(i+7,64,:,1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i+7,64,:,2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i+7,64,:,3)),'Color','r','LineStyle','-') 
    title('Profile Cancellation')
    grid on
    suptitle(['Chevreul Illusion with target size ',num2str(int8(heightC(contTarg)*128))])
    pause
    i = i+1
    contTarg = contTarg+1
    
end

%% Hong-Shevell Rings

i=91
sparialFreq = [0.03,0.05,0.07,0.09,0.12,0.15]
contTarg = 1
while i<102
    
    porVert =64 
    
    toShow(:,:,1) = squeeze(illusions(i,:,:,3));
    toShow(:,:,2) = squeeze(illusions(i,:,:,2));
    toShow(:,:,3) = squeeze(illusions(i,:,:,1));
    
    toShow2(:,:,1) = squeeze(illusions(i+1,:,:,3));
    toShow2(:,:,2) = squeeze(illusions(i+1,:,:,2));
    toShow2(:,:,3) = squeeze(illusions(i+1,:,:,1));  
    
    gray = (illusions(i,porVert,:,1)+illusions(i,porVert,:,2)+illusions(i,porVert,:,3))/3
    gray2 = (illusions(i+1,porVert,:,1)+illusions(i+1,porVert,:,2)+illusions(i+1,porVert,:,3))/3
   
    subplot(2,3,1)
    imshow(squeeze(toShow),[])
    title('White output')
    subplot(2,3,2)
    imshow(squeeze(toShow2),[])
    title('Dark output')
    subplot(2,3,3)
    plot(squeeze(illusions(i,porVert,:,1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,porVert,:,2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,porVert,:,3)),'Color','r','LineStyle','-')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,1)),'Color','b','LineStyle',':')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,2)),'Color','g','LineStyle',':')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,3)),'Color','r','LineStyle',':')
    title('Profiles')
    grid on
    subplot(2,3,4)
    plot(squeeze(illusions(i,porVert,:,1)),'b')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,1)),'k')
    grid on
    title('Profile Blue')
    subplot(2,3,5)
    plot(squeeze(illusions(i,porVert,:,2)),'g')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,2)),'k')
    grid on
    title('Profile Green')
    subplot(2,3,6)
    plot(squeeze(illusions(i,porVert,:,3)),'r')
    hold on
    plot(squeeze(illusions(i+1,porVert,:,3)),'k')
    grid on
    title('Profile Red')    

    suptitle(['Hong-Shevell Rings at  ',num2str((sparialFreq(contTarg)))])
    pause
    close all
    i = i+2
    contTarg = contTarg+1
    
end


%% Luminance gradient

i = 85
sizeTarget = [10,20,30,40,50,60] 

begin = [21,81];

contTarg = 1
while i<90
    
    toShow(:,:,1) = squeeze(illusions(i,:,:,3));
    toShow(:,:,2) = squeeze(illusions(i,:,:,2));
    toShow(:,:,3) = squeeze(illusions(i,:,:,1));
    
    subplot(2,3,1)
    imshow(toShow,[])
    title('Output')
    subplot(2,3,2)
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),3)),'Color','r','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),1)),'Color','b','LineStyle',':')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),2)),'Color','g','LineStyle',':')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),3)),'Color','r','LineStyle',':')
    title('Profiles')
    grid on
    subplot(2,3,3)
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),1)),'Color','b','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),1)),'Color','k','LineStyle','-')
    grid on
    title('Profile Blue')
    subplot(2,3,4)
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),2)),'Color','g','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),2)),'Color','k','LineStyle','-')
    grid on
    title('Profile Green')
    subplot(2,3,5)
    plot(squeeze(illusions(i,:,21+int8(sizeTarget(contTarg)/4),3)),'Color','r','LineStyle','-')
    hold on
    plot(squeeze(illusions(i,:,81+int8(sizeTarget(contTarg)/4),3)),'Color','k','LineStyle','-')
    grid on
    title('Profile Red')
    
    suptitle(['Luminance gradient with target size ',num2str(int8(sizeTarget(contTarg)))])
    pause   
    i = i+1
    contTarg = contTarg+1
    close all
    
    
end

