






function imageSet = makeGridImage(chromosomeMatrix)

    imageSet = zeros(256,256,1,size(chromosomeMatrix,3));

    for i=1:size(chromosomeMatrix,3)
        
        
        if(i>100)

            stepSize = bi2de(chromosomeMatrix(1,:,i-100));
            withGrid = bi2de(chromosomeMatrix(2,:,i-100));
        else
            stepSize = bi2de(chromosomeMatrix(1,:,i));
            withGrid = bi2de(chromosomeMatrix(2,:,i));
            
            
        end
        barInt = bi2de(chromosomeMatrix(3,:,i));
        backgroundInt = bi2de(chromosomeMatrix(4,:,i));
        if(backgroundInt>8)
           
            backgroundInt =1;
        
        else
            backgroundInt =0;           
            
        end
        
        if(barInt>8)
           
            barInt =1;
        
        else
            barInt =0;           
            
        end        
%         barInt = 1;
%         backgroundInt = 0;

        image2 = ones(256,256)*backgroundInt;


        [rows, columns, numberOfColorChannels] = size(image2);
        % 
        for row=1:stepSize:rows
%             row
            image2(row:row+withGrid,:) = barInt;
        end

        for col=1:stepSize:columns

            image2(:,col:col+withGrid) = barInt;

        end
%         
%         size(image2)
%         size(imageSet(:,:,1,i))
        imageSet(:,:,1,i) = image2(1:256,1:256);
% 
%         imshow(imageSet(:,:,1,i),[])
%         pause
    end
end