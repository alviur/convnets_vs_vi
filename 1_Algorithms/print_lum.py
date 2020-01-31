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


# Generate Luminance gradient =================================================
        
colors[0,0] = colors[0,1] = colors[0,2] = 0
colors[1,0] = colors[1,1] = colors[1,2] = 0.5
colors[2,0] = colors[2,1] = colors[2,2] = 0.5  

sizeTarget = [25,50,70,90,110,18]        
     
for i in range(len(sizeTarget)):
    cv2.imwrite(savePath+str(i)+'.png',generate_luminance_gradient.generateLuminanceGradient(
    outputSize,sizeTarget[i],colors)*255)


