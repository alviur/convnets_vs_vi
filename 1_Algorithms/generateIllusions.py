# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 09:29:05 2018

@author: root
"""

# Libraries
import numpy as np
import matplotlib.pyplot as plt
import generate_white_illussion
import generate_white_illussion2
import generate_dungeon
import generate_dungeon2
import generate_Chevreul
import generate_luminance_gradient
import generate_Shevells_ringsl
import generate_Shevells_ringsl2
import generate_grating_induction_color2
import generate_grating_induction2
import generate_white_illussionSym
import generate_brightnessContrast
import cv2


savePath = '/home/alexander/Desktop/CVPR/2_Data/'
imageSavePath = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/'
maskPaths = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masks/'
maskDungeon = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masksDungeon/'
maskShevell = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/masksShevell/'
maskLuminance = '/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/maskLum/'
'''

savePath = '/home/alexander/Desktop/CVPR/2_Data/'
imageSavePath = '/home/alexander/Desktop/CVPR/temp/gray/'
maskPaths = '/home/alexander/Desktop/CVPR/temp/whiteTargets/'
maskDungeon = '/home/alexander/Desktop/CVPR/temp/dungeonTargets/'
maskShevell = '/home/alexander/Desktop/CVPR/temp/maskShevell/'
maskLuminance = '/home/alexander/Desktop/CVPR/temp/maskLuminance/'
'''

colors = np.zeros((3,3))
sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15]
outputSize=128
sizeShevell = 45

data = np.zeros((102,outputSize,outputSize,3))
cont = 0

## Generate white's Illusions =================================================

colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5

for i in range(len(sparialFreq)):

    data[cont,:,:,:] = generate_white_illussion.generateWhite(outputSize, 0.1
    ,sparialFreq[i],colors)
    
#    
#    data[cont,:,:,:] = generate_white_illussionSym.generateWhiteSimetric(outputSize, 0.1
#    ,sparialFreq[i],colors)
    
    plt.imshow(data[cont,:,:,:])
    plt.show()    
     
    
    cont += 1

    cv2.imwrite(maskPaths+str(i)+'.png',generate_white_illussion2.generateWhiteTarget(outputSize, 0.1
    ,sparialFreq[i],colors)*255)

    
## Generate Dungeon Illusions =================================================
    
colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  

sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  

'''

for i in range(len(sparialFreqDun)):

    if(sparialFreqDun[i]==0.03):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],126,126, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],126,126, colors)
        
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
        
        
    elif(sparialFreqDun[i]==0.09):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.42,sparialFreqDun[i],130,130, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.42,sparialFreqDun[i],130,130, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
        

    elif(sparialFreqDun[i]==0.12):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],128,128, colors) 
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],128,128, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
    elif(sparialFreqDun[i]==0.15):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],134,134, colors)  
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],134,134, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
    elif(sparialFreqDun[i]==0.05):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],132,132, colors)  
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],132,132, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)        
    else:
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],129,129, colors)#129
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],129,129, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
 

    cont += 2
    
'''    

for i in range(len(sparialFreqDun)):

    if(sparialFreqDun[i]==0.03):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],62,62, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],62,62, colors)
        
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
        
        
    elif(sparialFreqDun[i]==0.09):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.40,sparialFreqDun[i],62,62, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.40,sparialFreqDun[i],62,62, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
        

    elif(sparialFreqDun[i]==0.12):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],62,62, colors) 
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],62,62, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
    elif(sparialFreqDun[i]==0.15):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],68,68, colors)  
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],68,68, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
        
    else:
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],64,64, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],64,64, colors)
        
        cv2.imwrite(maskDungeon+str(i)+'.png',dataImg[0,:,:,:]*255)
 
    plt.imshow(data[cont,:,:,:])
    plt.show()    
    cont += 2



## Generate Chevreul Illusion =================================================

heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7]

colors[0,0] = colors[0,1] = colors[0,2] = 0
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0  

for i in range(len(heightC)):

    data[cont,:,:,:] = generate_Chevreul.generateChevreul(outputSize,heightC[i]
    ,0.3,5,False, colors)           
     

    
    cont += 1

# Cancellation
for i in range(len(heightC)):

    data[cont,:,:,:] = generate_Chevreul.generateChevreul(outputSize,heightC[i]
    ,0.3,5,True, colors)           

    
    cont += 1  
        
# Generate Luminance gradient =================================================
        
colors[0,0] = colors[0,1] = colors[0,2] = 0
colors[1,0] = colors[1,1] = colors[1,2] = 0.5
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  

sizeTarget = [1,3,5,7,9,12]        
     
for i in range(len(sizeTarget)):
    data[cont,:,:,:] = generate_luminance_gradient.generateLuminanceGradient(
    outputSize,sizeTarget[i],colors)   

    cv2.imwrite(maskLuminance+str(i)+'.png',generate_grating_induction2.generateLuminanceGradient2(
    outputSize,sizeTarget[i],colors)*255)   
   

    #plt.imshow(data[cont,:,:,:])
    #plt.show()
    
    cont += 1
    
    
## Generate Brightness Contrast=================================================    
#colors[0,0] = colors[0,1] = colors[0,2] = 0
#colors[1,0] = colors[1,1] = colors[1,2] = 1
#colors[2,0] = colors[2,1] = colors[2,2] = 0.5  
#
#sizeTarget = [3,5,7,9,12,15]        
#     
#for i in range(len(sizeTarget)):
#    
#    data[cont,:,:,:] = generate_brightnessContrast.generateBrightnessContrast(outputSize,sizeTarget[i],colors)   
#
#
#    #plt.imshow(data[cont,:,:,:])
#    #plt.show()
#    
#    cont += 1    

# Generate Shevell's Rings ==================================================== 

colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  



sparialFreq = [0.03,0.05,0.07,0.09,0.12,0.15]

for i in range(len(sparialFreq)):

    data[cont:cont+2,:,:,:] = generate_Shevells_ringsl.generateShevellsRings(outputSize, sizeShevell
    ,sparialFreq[i],colors)
    
    
    cv2.imwrite(maskShevell+str(i)+'.png',generate_Shevells_ringsl2.generateShevellsRings2(outputSize, sizeShevell
    ,sparialFreq[i],colors)*255)
    
   
    cont += 2    


###############################################################################
###########################color###############################################

colors = np.zeros((3,3))
sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15]


## Generate white's Illusions =================================================

colors[0,0] = 0
colors[0,1] = 0
colors[0,2] = 1
colors[1,0] = 0
colors[1,1] = 1
colors[1,2] = 1
colors[2,0] = 0
colors[2,1] = 0.5
colors[2,2] = 1

for i in range(len(sparialFreq)):

    data[cont,:,:,:] = generate_white_illussion.generateWhite(outputSize, 0.1
    ,sparialFreq[i],colors)
    
    
    #data[cont,:,:,:] = generate_white_illussionSym.generateWhiteSimetric(outputSize, 0.1
    #,sparialFreq[i],colors)

    cont += 1
    
## Generate Dungeon Illusions =================================================
    
colors[0,0] = 1
colors[0,1] = 0.58
colors[0,2] = 0
colors[1,0] = 1
colors[1,1] = 0
colors[1,2] = 1
colors[2,0] = 0
colors[2,1] = 1
colors[2,2] = 0.58  

sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  

'''

for i in range(len(sparialFreqDun)):

    if(sparialFreqDun[i]==0.03):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],126,126, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],126,126, colors)
        
        
        
        
        
    elif(sparialFreqDun[i]==0.09):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.42,sparialFreqDun[i],130,130, colors)
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.42,sparialFreqDun[i],130,130, colors)
        
        
        

    elif(sparialFreqDun[i]==0.12):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],128,128, colors) 
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],128,128, colors)
        
        
    elif(sparialFreqDun[i]==0.15):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],133,133, colors)  
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.45,sparialFreqDun[i],133,133, colors)
        
        
    elif(sparialFreqDun[i]==0.05):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],132,132, colors)  
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],132,132, colors)
        
    else:
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],129,129, colors)#129
        
        dataImg = generate_dungeon2.generateDungeon2(outputSize
        ,0.4,sparialFreqDun[i],129,129, colors)
        
    
    cont += 2

'''

for i in range(len(sparialFreqDun)):

    if(sparialFreqDun[i]==0.03):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],62,62, colors)
    elif(sparialFreqDun[i]==0.09):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.40,sparialFreqDun[i],62,62, colors)

    elif(sparialFreqDun[i]==0.12):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],62,62, colors)        
        
    elif(sparialFreqDun[i]==0.15):
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.45,sparialFreqDun[i],68,68, colors)        
        
    else:
        data[cont:cont+2,:,:,:] = generate_dungeon.generateDungeon(outputSize
        ,0.4,sparialFreqDun[i],64,64, colors)
 

        
    cont += 2

## Generate Chevreul Illusion =================================================

heightC = [0.1,0.2,0.3,0.4,0.5,0.6,0.7]

colors[0,0] = 0
colors[0,1] = 0
colors[0,2] = 1
colors[1,0] = 0
colors[1,1] = 0
colors[1,2] = 1 
colors[2,0] = 0
colors[2,1] = 0  
colors[2,2] = 1

for i in range(len(heightC)):

    data[cont,:,:,:] = generate_Chevreul.generateChevreul(outputSize,heightC[i]
    ,0.3,5,False, colors) 
    
  
           
  
    cont += 1

# Cancellation
for i in range(len(heightC)):

    data[cont,:,:,:] = generate_Chevreul.generateChevreul(outputSize,heightC[i]
    ,0.3,5,True, colors)          
    
    cont += 1  
        
## Generate Luminance gradient =================================================
#        
colors[0,0] = 0
colors[0,1] = 1
colors[0,2] = 0
colors[1,0] = 0
colors[1,1] = 0
colors[1,2] = 0
colors[2,0] = 0
colors[2,1] = 1
colors[2,2] = 1 

#sizeTarget = [10,20,30,40,50,60] 
sizeTarget = [1,3,5,7,9,12] 
   
     
for i in range(len(sizeTarget)):
    data[cont,:,:,:] = generate_grating_induction_color2.generateLuminanceGradientColor2(
    outputSize,sizeTarget[i],colors)        
   


    
    cont += 1
        
# Generate Brightness Contrast=================================================    
#colors[0,0] = 0
#colors[0,1] = 0
#colors[0,2] = 1
#colors[1,0] = 0
#colors[1,1] = 1
#colors[1,2] = 1
#colors[2,0] = 0
#colors[2,1] = 0.5
#colors[2,2] = 1

#sizeTarget = [3,5,7,9,12,15]        
#     
#for i in range(len(sizeTarget)):
#    
#    data[cont,:,:,:] = generate_brightnessContrast.generateBrightnessContrast(outputSize,sizeTarget[i],colors)   
#    
#    cont += 1
#
#
#    #plt.imshow(data[cont,:,:,:])
#    #plt.show()
#            
    
# Generate Shevell's Rings ==================================================== 

colors[0,0] = 1
colors[0,1] = 0.58
colors[0,2] = 0
colors[1,0] = 1
colors[1,1] = 0
colors[1,2] = 1
colors[2,0] = 0
colors[2,1] = 1
colors[2,2] = 0.58  

sparialFreq = [0.03,0.05,0.07,0.09,0.12,0.15]

for i in range(len(sparialFreq)):

    data[cont:cont+2,:,:,:] = generate_Shevells_ringsl.generateShevellsRings(outputSize, sizeShevell
    ,sparialFreq[i],colors)
    

    
    cont += 2       
    
path='/home/alexander/Desktop/CVPR/4_State_of_Art/DnCNN-master/TrainingCodes/dncnn_keras/data/Test/illusions/'   
for i in range(data.shape[0]):
    
    
    temp = np.zeros((outputSize,outputSize,3))
    
    temp[:,:,0] = data[i,:,:,0]*255
    temp[:,:,1] = data[i,:,:,1]*255
    temp[:,:,2] = data[i,:,:,2]*255
    
    cv2.imwrite(path+str(i)+'.png',temp)
    

np.save(savePath+'ilussions',data)

'''
path='/home/alexander/Desktop/CVPR/temp/matlabInput/'   
for i in range(data.shape[0]):
    
    cv2.imwrite(path+str(i)+'.png',data[i,:,:,:]*255)
'''