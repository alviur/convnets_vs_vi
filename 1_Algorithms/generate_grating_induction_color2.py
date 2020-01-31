# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 08:47:59 2018

@author: root
"""

# Libraries
import numpy as np
import cv2 
import matplotlib.pyplot as plt

def generateLuminanceGradientColor2(outputSize,sizeTarget,colors):
    '''
    #Parameters
    outputSize = 128 # Size of the output image
    sizeTarget = 10 
    
    colors = np.zeros((3,3))
    colors[0,0] = 1
    colors[0,1] = 1
    colors[0,2] = 0
    colors[1,0] = 1
    colors[1,1] = 1
    colors[1,2] = 0.5
    colors[2,0] = 0
    colors[2,1] = 0
    colors[2,2] = 1   
    '''
    
    image = np.ones((outputSize,outputSize,3))
    
    gradient = np.linspace(0,1, num=outputSize/2 +0.5*outputSize)
    begin = 0
    for i in range(int(outputSize/2 + 0.5*outputSize)-begin):
        
        if(colors[0,0]==0):
            image[:,begin+i,0] = gradient[i]
        else:
            image[begin+i,:,0] = colors[0,0]
#            
        if(colors[0,1]==0):        
            image[:,begin+i,1] = gradient[i]
        else:
            image[:,begin+i,1] = colors[0,1]
            
        if(colors[0,2]==0):
            image[:,begin+i,2] = gradient[i]
        else:
            image[:,begin+i,2] = colors[0,2]
#    
#    gradient = np.linspace(0, 1, num=outputSize/2 +0.05*outputSize) 

#      
#    for i in range(int(outputSize/2 +64)):
#        
#        image[:,int(outputSize-i-1),2] = image[:,int(outputSize-i-1),2] - (image[:,int(outputSize-i-1),2]-i/128)
#        image[:,int(outputSize-i-1),1] = image[:,int(outputSize-i-1),1] - (image[:,int(outputSize-i-1),1]-i/128)


      
    for i in range(int(outputSize/2 +64)):
        
        image[:,int(outputSize-i-1),2] = (128-i)/128
        image[:,int(outputSize-i-1),1] = i/128
        image[:,int(outputSize-i-1),0] = 0
#        image[:,int(outputSize-i-1),1] = image[:,int(outputSize-i-1),1] - (image[:,int(outputSize-i-1),1]-i/128)

    # Positions
    pos = np.zeros((5,2)) 
    pos[0,0] = int(outputSize/2)
    pos[0,1] = int(outputSize/2)
    pos[1,0] = int((outputSize/3)/2)
    pos[1,1] = int((outputSize/3)/2)
    pos[2,1] = int((outputSize/3)/2)
    pos[2,0] = (outputSize/3)*2 + (outputSize/3)/2
    pos[3,1] = (outputSize/3)*2 + (outputSize/3)/2
    pos[3,0] = int((outputSize/3)/2)
    pos[4,1] = (outputSize/3)*2 + (outputSize/3)/2
    pos[4,0] = (outputSize/3)*2 + (outputSize/3)/2 

    temp = np.zeros((outputSize,outputSize,3))
    
    temp[:,:,0] = image[i,:,0]
    temp[:,:,1] = image[i,:,1]
    temp[:,:,2] = image[i,:,2]
        

    cv2.circle(temp,(int(pos[0,0]),int(pos[0,1])), sizeTarget, (0,0.5,0.5),-1)
    cv2.circle(temp,(int(pos[1,0]),int(pos[1,1])), sizeTarget,  (0,0.5,0.5),-1)
    cv2.circle(temp,(int(pos[2,0]),int(pos[2,1])), sizeTarget,  (0,0.5,0.5),-1)
    cv2.circle(temp,(int(pos[3,0]),int(pos[3,1])), sizeTarget,  (0,0.5,0.5),-1)
    cv2.circle(temp,(int(pos[4,0]),int(pos[4,1])), sizeTarget,  (0,0.5,0.5),-1)
    
    
    return temp



