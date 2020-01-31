# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 08:47:59 2018

@author: root
"""

# Libraries
import numpy as np
import cv2 
import matplotlib.pyplot as plt

def generateLuminanceGradientColor(outputSize,sizeTarget,colors):
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
#    for i in range(int(outputSize/2 + 0.5*outputSize)-begin):
#        
#        if(colors[0,0]==0):
#            image[begin+i,:,0] = gradient[i]
#        else:
#            image[begin+i,:,0] = colors[0,0]
#            
#        if(colors[0,1]==0):        
#            image[begin+i,:,1] = gradient[i]
#        else:
#            image[begin+i,:,1] = colors[0,1]
#            
#        if(colors[0,2]==0):
#            image[begin+i,:,2] = gradient[i]
#        else:
#            image[begin+i,:,2] = colors[0,2]
    
    gradient = np.linspace(0, 1, num=outputSize/2 +0.05*outputSize) 

      
    for i in range(int(outputSize/2 +64)):
        
        image[int(outputSize-i-1),:,0] = image[int(outputSize-i-1),:,0] - (image[int(outputSize-i-1),:,0]-i/128)
        image[int(outputSize-i-1),:,1] = image[int(outputSize-i-1),:,1] - (image[int(outputSize-i-1),:,1]-i/128)
        
        #image[:,int(outputSize-i-1),1] = 1 - (i/64)
     
    
    withTarget = int(sizeTarget/2)  
    gradient2 = np.linspace(0,1, num=sizeTarget)
    begin1 = 65
    begin2 = 20
    hor1 = 80
    hor2 = 20
    
    for i in range(int(sizeTarget)):
        
        if(colors[0,0]==0):
            image[begin1+i,hor1:hor1+withTarget,0] = gradient2[i]
            image[begin2+i,hor2:hor2+withTarget,0] = gradient2[i]
        else:
            image[begin1+i,hor1:hor1+withTarget,0] = colors[0,0]
            image[begin2+i,hor2:hor2+withTarget,0] = colors[0,0]
            
        if(colors[0,1]==0):        
            image[begin1+i,hor1:hor1+withTarget,1] = gradient2[i]
            image[begin2+i,hor2:hor2+withTarget,1] = gradient2[i]
        else:
            image[begin1+i,hor1:hor1+withTarget,1] = colors[0,1]
            image[begin2+i,hor2:hor2+withTarget,1] = colors[0,1]
            
        if(colors[0,2]==0):
            image[begin1+i,hor1:hor1+withTarget,2] = gradient2[i]
            image[begin2+i,hor2:hor2+withTarget,2] = gradient2[i]
        else:
            image[begin1+i,hor1:hor1+withTarget,2] = colors[0,2]
            image[begin2+i,hor2:hor2+withTarget,2] = colors[0,2]
    
    
    blue = 0.7
    for i in range(int(sizeTarget/2 +sizeTarget/2)):
        
        image[begin1+int(sizeTarget-i-1),hor1:hor1+withTarget,0] = image[begin1+int(sizeTarget-i-1),hor1:hor1+withTarget,0] - (image[int(begin1+sizeTarget-i-1),hor1:hor1+withTarget,0]-i/(sizeTarget/blue))
        image[begin1+int(sizeTarget-i-1),hor1:hor1+withTarget,1] = image[begin1+int(sizeTarget-i-1),hor1:hor1+withTarget,1] - (image[int(begin1+sizeTarget-i-1),hor1:hor1+withTarget,1]-i/(sizeTarget/blue))
        image[begin2+int(sizeTarget-i-1),hor2:hor2+withTarget,0] = image[begin2+int(sizeTarget-i-1),hor2:hor2+withTarget,0] - (image[int(begin2+sizeTarget-i-1),hor2:hor2+withTarget,0]-i/(sizeTarget/blue))
        image[begin2+int(sizeTarget-i-1),hor2:hor2+withTarget,1] = image[begin2+int(sizeTarget-i-1),hor2:hor2+withTarget,1] - (image[int(begin2+sizeTarget-i-1),hor2:hor2+withTarget,1]-i/(sizeTarget/blue))
        
    
    return image



