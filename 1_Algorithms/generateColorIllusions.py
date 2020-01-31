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
import generate_grating_induction_color
import generate_Shevells_ringsl
import cv2

colors = np.zeros((3,3))
sparialFreq = [0.01,0.03,0.05,0.07,0.09,0.12,0.15]
outputSize=128

data = np.zeros((51,outputSize,outputSize,3))
cont = 0

## Generate white's Illusions =================================================

colors[0,0] = 1
colors[0,1] = 1
colors[0,2] = 0
colors[1,0] = 0
colors[1,1] = 0
colors[1,2] = 1
colors[2,0] = 1
colors[2,1] = 0
colors[2,2] = 0

for i in range(len(sparialFreq)):

    data[cont,:,:,:] = generate_white_illussion.generateWhite(outputSize, 0.1
    ,sparialFreq[i],colors)

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

colors[0,0] = 1
colors[0,1] = 0
colors[0,2] = 0
colors[1,0] = 1
colors[1,1] = 0
colors[1,2] = 0
colors[2,0] = 0
colors[2,1] = colors[2,2] = 0  

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
        
colors[0,0] = 1
colors[0,1] = 1
colors[0,2] = 0
colors[1,0] = 1
colors[1,1] = 1
colors[1,2] = 0.5
colors[2,0] = 0
colors[2,1] = 0
colors[2,2] = 1 

sizeTarget = [10,20,30,40,50,60] 

   
     
for i in range(len(sizeTarget)):
    data[cont,:,:,:] = generate_grating_induction_color.generateLuminanceGradientColor(
    128,sizeTarget[i],colors)        
   


    
    cont += 1
    
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

    data[cont:cont+2,:,:,:] = generate_Shevells_ringsl.generateShevellsRings(outputSize, 50
    ,sparialFreq[i],colors)
    
    plt.imshow(data[cont,:,:,:])
    plt.show()    
    plt.imshow(data[cont+1,:,:,:])
    plt.show() 
    
    cont += 2       
    
path='/home/alexander/Desktop/CVPR/temp/gray/'   
for i in range(data.shape[0]):
    
    
    temp = np.zeros((128,128,3))
    
    temp[:,:,0] = data[i,:,:,2]*255
    temp[:,:,1] = data[i,:,:,1]*255
    temp[:,:,2] = data[i,:,:,0]*255
    
    cv2.imwrite(path+str(i)+'.png',temp)
    