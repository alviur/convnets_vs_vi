%% Whites illusion
% 
% sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15];
% kernelSize = [3,5,7,11,15]
% contTarg = 1
% toShow = zeros(128,128,3);
% contKernel = 5
% 
% targetPos = [41,92;34,86;39,81;41,86;30,90;38,83;48,105];
% pixelSize = int8(128*sparialFreq);
% meanSize = [0,1,1,2,4,5,7];
% meanSize2 = [0,2,3,4,6,7,9];
% for i=52:58
%     
%     toShow(:,:,1) = squeeze(illusions(i,:,:,3));
%     toShow(:,:,2) = squeeze(illusions(i,:,:,2));
%     toShow(:,:,3) = squeeze(illusions(i,:,:,1));
%    
%    
%     % Lines
% 
%     6-verticalFactor
%     if(6-int8(kernelSize(contKernel)/2)>0)
%         verticalFactor = 6-int8(kernelSize(contKernel)/2);
%     else
%         
%         verticalFactor = 0
%         
%     end    
%     
%     if(meanSize2(contTarg)-int8(kernelSize(contKernel)/2)>0)
%         horFactor = meanSize2(contTarg)-int8(kernelSize(contKernel)/2)
%     else
%         
%         horFactor = 0
%         
%     end
%     
%    
%     
%     toShow(64-verticalFactor:64+verticalFactor...
%         ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,1)=1;
%     toShow(64-verticalFactor:64+verticalFactor,targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,1)=1;
%     imshow(toShow)
%     
%     
%     pause
%     contTarg = contTarg+ 1;
%     
% end



function [replication] =measureWhiteColor(illusions,kernelSize)

    %sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15];
    contTarg = 1;
    replication = zeros(size(illusions,1),3);

    toShow = zeros(128,128,3);
    targetPos = [41,92;34,86;39,81;41,86;30,90;38,83;48,105];
    meanSize2 = [0,2,3,4,6,7,9];
    for i=1:size(illusions,1)

        toShow(:,:,1) = squeeze(illusions(i,:,:,3));
        toShow(:,:,2) = squeeze(illusions(i,:,:,2));
        toShow(:,:,3) = squeeze(illusions(i,:,:,1));
        
        hsv = rgb2hsv(toShow);

        if(6-int8(kernelSize/2)>0)
            verticalFactor = 6-int8(kernelSize/2);
        else

            verticalFactor = 0;

        end    

        if(meanSize2(contTarg)-int8(kernelSize/2)>0)
            horFactor = meanSize2(contTarg)-int8(kernelSize/2);
        else

            horFactor = 0;

        end

        if(horFactor>0 && kernelSize<11)
            

            mTarget1=mean(mean(hsv(64-verticalFactor:64+verticalFactor...
                ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,1)));
            mTarget2=mean(mean(hsv(64-verticalFactor:64+verticalFactor...
                ,targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,1)));


            mTarget3=mean(mean(toShow(64-verticalFactor:64+verticalFactor...
                ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
            mTarget4=mean(mean(toShow(64-verticalFactor:64+verticalFactor...
                ,targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));     
            
            

    %         toShow(64-verticalFactor:64+verticalFactor...
    %             ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,1) = 1
    %         
    %         toShow(64-verticalFactor:64+verticalFactor,targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,1) = 1
    %         
    %         imshow(toShow)
    %         pause        


        else
            
            if(targetPos(contTarg,1)+horFactor+1-(targetPos(contTarg,1)-horFactor)>1  && kernelSize<11 )
                
                mTarget1=mean(mean(hsv(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor+1,1)));
                mTarget2=mean(mean(hsv(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor+1,1)));

                mTarget3=mean(mean(toShow(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
                mTarget4=mean(mean(toShow(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));  
            
            elseif(kernelSize>=11 )
                
                mTarget1=mean(mean(hsv(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor+1,1)));
                mTarget2=mean(mean(hsv(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor+1,1)));

                mTarget3=(mean(toShow(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
                mTarget4=(mean(toShow(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));               
                             
                if(angularError(squeeze(mTarget3),squeeze(mTarget4))==0)
                    
                    
                    mTarget3=((toShow(64-verticalFactor:64+verticalFactor...
                        ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
                    mTarget4=((toShow(64-verticalFactor:64+verticalFactor,...
                        targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));


                end                 
                
            else
                
                
                
                mTarget1=mean(mean(hsv(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor+1,1)));
                mTarget2=mean(mean(hsv(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor+1,1)));

                mTarget3=(mean(toShow(64-verticalFactor:64+verticalFactor...
                    ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
                mTarget4=(mean(toShow(64-verticalFactor:64+verticalFactor,...
                    targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));
%                 
%                 if(angularError(squeeze(mTarget3),squeeze(mTarget4))==0)
%                     
%                     
%                     mTarget3=((toShow(64-verticalFactor:64+verticalFactor...
%                         ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor,:)));
%                     mTarget4=((toShow(64-verticalFactor:64+verticalFactor,...
%                         targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor,:)));
% 
% 
%                 end                
                
                
            end
            
            
            
       


    %         toShow(64-verticalFactor:64+verticalFactor...
    %             ,targetPos(contTarg,1)-horFactor:targetPos(contTarg,1)+horFactor+1,1) = 1
    %         
    %         toShow(64-verticalFactor:64+verticalFactor,targetPos(contTarg,2)-horFactor:targetPos(contTarg,2)+horFactor+1,1) = 1
    %         
    %         imshow(toShow)
    %         pause        
%         
        end
        


        contTarg = contTarg+ 1;
        
 
        
        %mTarget1 = (mTarget1(1,1,1)+mTarget1(1,1,2)+mTarget1(1,1,3))/3;
        %mTarget2 = (mTarget2(1,1,1)+mTarget2(1,1,2)+mTarget2(1,1,3))/3;
        
        size(mTarget3)
        
        replication(i,1) = angularError(squeeze(mTarget3),squeeze(mTarget4));
        replication(i,2) = mTarget1;
        replication(i,3) = mTarget2;

    end



end


function angE = angularError(v1,v2)

%angular_error=arc cos( (v1·v2) / (||v1|| ||v2||) ) 



        angE = acos(dot(v1,v2)/(norm(v1)*norm(v2)));



end