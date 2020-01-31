


kernelSize = [3,5,7,11,15];
numKernels = [8,16,32,64,128];
poolingSize = [2,4,8];

matPath = '/home/alexander/Desktop/CVPR/temp/matlab/';
savePath = '/home/alexander/Desktop/CVPR/temp/results/0_temp/'; 

txtfile = '/home/alexander/Desktop/CVPR/temp/results/0_temp/';


%% White

cont = 1;
data = zeros(25,14);

for i=1:(length(kernelSize))
    for j=1:(length(numKernels))    


        %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

        path = ['Illusions_r',num2str(kernelSize(i)),'_nk',num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.mat']
        
        text = fileread([txtfile,'Illusions_r',num2str(kernelSize(i)),'_nk',...
            num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.txt']);
        
        stds = strfind(text,'-');
        ssim = strfind(text,'SSIM');
        
        load([matPath,path])
        
       % replication=measureWhiteGray(illusions(1:7,:,:,:),kernelSize(i))
        replication=measureWhiteGray2(illusions(1:7,:,:,:))
        
        data(cont,1) = kernelSize(i);
        data(cont,2) = numKernels(j);
        data(cont,3) = poolingSize(1);
        data(cont,4) = str2num(text(10:15));
        data(cont,5) = str2num(text(stds(1)+1:stds(1)+4));
        data(cont,6) = str2num(text(ssim+4:ssim+8));
        data(cont,7) = str2num(text(stds(2)+1:stds(2)+4));        
        
        
        data(cont,8:14) = replication;
        
%         kernelSize(i)
%         
%         pause 
        
        cont = cont + 1;

    end
end
% csvwrite('test.csv',data)
%% White Color

cont = 1;
data = zeros(25,28);
   
for i=1:(length(kernelSize)) 
    for j=1:(length(numKernels))         
 
 
        %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

        path = ['Illusions_r',num2str(kernelSize(i)),'_nk',num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.mat']
        text = fileread([txtfile,'Illusions_r',num2str(kernelSize(i)),'_nk',...
            num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.txt']); 
        
        stds = strfind(text,'-');
        ssim = strfind(text,'SSIM');
        load([matPath,path])
        
        %replication=measureWhiteColor(illusions(52:58,:,:,:),kernelSize(i))
        replication=measureWhiteColor2(illusions(52:58,:,:,:))
        
        data(cont,1) = kernelSize(i);
        data(cont,2) = numKernels(j);
        data(cont,3) = poolingSize(1);
        data(cont,4) = str2num(text(10:15));
        data(cont,5) = str2num(text(stds(1)+1:stds(1)+4));
        data(cont,6) = str2num(text(ssim+4:ssim+8));
        data(cont,7) = str2num(text(stds(2)+1:stds(2)+4));  
        data(cont,8:28) = reshape(replication',[21,1]); 
        
        kernelSize(i)
        
%         pause 
        
        cont = cont +1;

    end
end

csvwrite('/media/alexander/lex_usb/whiteColorKernel.csv',data)

%% Dungeon

cont = 1;
data = zeros(25,13);


for i=2:(length(kernelSize))   
    for j=1:(length(numKernels))     
 

        %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

        path = ['Illusions_r',num2str(kernelSize(i)),'_nk',num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.mat']
        
        text = fileread([txtfile,'Illusions_r',num2str(kernelSize(i)),'_nk',...
            num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.txt']);
        
        stds = strfind(text,'-');
        ssim = strfind(text,'SSIM');        
        
        load([matPath,path])
         
        %replication,totalNoK=measureDungeonGray(illusions(8:19,:,:,:),kernelSize(i))
        replication=measureDungeonGray2(illusions(8:19,:,:,:),kernelSize(i),numKernels(j));
        
        data(cont,1) = kernelSize(i);
        data(cont,2) = numKernels(j);
        data(cont,3) = poolingSize(1);
        data(cont,4) = str2num(text(10:15));
        data(cont,5) = str2num(text(stds(1)+1:stds(1)+4));
        data(cont,6) = str2num(text(ssim+4:ssim+8));
        data(cont,7) = str2num(text(stds(2)+1:stds(2)+4));
        data(cont,8:13) = replication;
        
        
        kernelSize(i)
        
        cont = cont +1;
        
%         pause 

    end
end

csvwrite('/media/alexander/lex_usb/dungeonGrayKernel.csv',data)

%% Luminance Gradient

cont = 1;
data = zeros(25,14);

for i=1:(length(kernelSize))
    for j=1:(length(numKernels))    


        %print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')

        path = ['Illusions_r',num2str(kernelSize(i)),'_nk',num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.mat']
        
        text = fileread([txtfile,'Illusions_r',num2str(kernelSize(i)),'_nk',...
            num2str(numKernels(j)),'_p',num2str(poolingSize(1)),'.txt']);
        
        stds = strfind(text,'-');
        ssim = strfind(text,'SSIM');
        
        load([matPath,path])
        
       % replication=measureWhiteGray(illusions(1:7,:,:,:),kernelSize(i))
        
        replication=measureLuminanceGray2(illusions(34:38,:,:,:))
        
        data(cont,1) = kernelSize(i);
        data(cont,2) = numKernels(j);
        data(cont,3) = poolingSize(1);
        data(cont,4) = str2num(text(10:15));
        data(cont,5) = str2num(text(stds(1)+1:stds(1)+4));
        data(cont,6) = str2num(text(ssim+4:ssim+8));
        data(cont,7) = str2num(text(stds(2)+1:stds(2)+4));        
        
        
        data(cont,8:14) = replication;
        
%         kernelSize(i)
%         
%         pause 
        
        cont = cont + 1;

    end
end


