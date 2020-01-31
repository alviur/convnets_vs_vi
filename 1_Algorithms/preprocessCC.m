
path = '/home/alexander/Desktop/CVPR/2_Data/CC/';
savePath = '/home/alexander/Desktop/CVPR/2_Data/';

folders = dir([path,'*_raw'])

resizeSize = 1024;
contImages = 1;


for i=4:length(folders)
    
    name = [path,folders(i).name]
    
    illuminantFold = dir([name,'/illuminant/*.png']);
    whiteBalancedFold = dir([name,'/whitebalanced/*.png']);

    
    for j=1:length(illuminantFold)
        
       try
        illuminant = imresize(imread([name,'/illuminant/',illuminantFold(j).name]),[resizeSize resizeSize]);
        white = imresize(imread([name,'/whitebalanced/',illuminantFold(j).name]),[resizeSize resizeSize]);
        
        
        for k=0:7
            
            for l=0:7
            
            
                imwrite(illuminant(l*128+1:l*128+128,k*128+1:k*128+128,:),[savePath,'input/',num2str(contImages),'.png'])
                imwrite(white(l*128+1:l*128+128,k*128+1:k*128+128,:),[savePath,'output/',num2str(contImages),'.png'])

                contImages = contImages + 1;

            end
            
        end
        
       catch
           
           [name,'/illuminant/',illuminantFold(j).name, 'Not found!']
            
       end
        
        
        
        
    end
    
    
end
