# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 09:29:05 2018

@author: root
"""

# Libraries
import numpy as np
import matplotlib.pyplot as plt
import generate_white_illussion
import generate_dungeon
import generate_Chevreul
import generate_luminance_gradient
import generate_Shevells_ringsl
import cv2


#savePath = '/home/alexander/Desktop/CVPR/2_Data/'#original
savePath = '/home/alexander/Desktop/CVPR/7_print/'#print

colors = np.zeros((3,3))
sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15]
outputSize=1024

data = np.zeros((51,outputSize,outputSize,3))
cont = 0

## Generate white's Illusions =================================================

colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5

for i in range(len(sparialFreq)):

    data[cont,:,:,:] = generate_white_illussion.generateWhite(outputSize, 0.1
    ,sparialFreq[i],colors)
    cont += 1
    
## Generate Dungeon Illusions =================================================
    
colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  

sparialFreqDun = [0.03,0.05,0.07,0.09,0.12,0.15]  

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

sizeTarget = [3,5,8,11,15,18]        
     
for i in range(len(sizeTarget)):
    data[cont,:,:,:] = generate_luminance_gradient.generateLuminanceGradient(
    outputSize,sizeTarget[i],colors)        
   

    #plt.imshow(data[cont,:,:,:])
    #plt.show()
    
    cont += 1

# Generate Shevell's Rings ==================================================== 

colors[0,0] = colors[0,1] = colors[0,2] = 1
colors[1,0] = colors[1,1] = colors[1,2] = 0
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  

sparialFreq = [0.03,0.05,0.07,0.09,0.12,0.15]

for i in range(len(sparialFreq)):

    data[cont:cont+2,:,:,:] = generate_Shevells_ringsl.generateShevellsRings(outputSize, 50
    ,sparialFreq[i],colors)
    
   
    cont += 2    


np.save(savePath+'ilussionsGray',data)

    
path= savePath
for i in range(data.shape[0]):
    
    cv2.imwrite(path+str(i)+'.png',data[i,:,:,:]*255)

