# -*- coding: utf-8 -*-
"""
Created on Wed Sep 19 14:31:37 2018

@author: root
"""

import numpy as np
import cv2 
import matplotlib.pyplot as plt

def generateChevreul(outputSize,height,firstStep,steps,invert, colors):

    #Parameters
    #outputSize = 128 # Size of the output image
    
    image = np.zeros((outputSize,outputSize,3))
    
    gradient = np.linspace(0, 1, num=outputSize)
    
    for i in range(outputSize):
        
        if(colors[0,0]==0):
            image[:,i,0] = gradient[i]
        else:
            image[:,i,0] = colors[0,0]
            
        if(colors[0,1]==0):        
            image[:,i,1] = gradient[i]
        else:
            image[:,i,1] = colors[0,1]
            
        if(colors[0,2]==0):
            image[:,i,2] = gradient[i]
        else:
            image[:,i,2] = colors[0,2]
    
    
    
    #height = 0.5
    #firstStep = 0.3
    #steps = 5
    stair = np.zeros((round(height*outputSize),round(height*outputSize),3))
    bandSize = round(stair.shape[0]/steps)
    
    
    
    for i in range(steps):
    
        if(colors[1,0]==0):          
           stair[:,i*bandSize:i*bandSize+bandSize,0] = firstStep + i/10
        else:
           stair[:,i*bandSize:i*bandSize+bandSize,0] = colors[1,0]
           
        if(colors[1,1]==0):    
        
            stair[:,i*bandSize:i*bandSize+bandSize,1] = firstStep + i/10
        else:
            stair[:,i*bandSize:i*bandSize+bandSize,1] = colors[1,1]        
           
        if(colors[1,2]==0): 
            stair[:,i*bandSize:i*bandSize+bandSize,2] = firstStep + i/10
        else:           
            
           stair[:,i*bandSize:i*bandSize+bandSize,2] = colors[1,2]
           
           
        if(i*bandSize+bandSize<stair.shape[1]):
            
            if(colors[1,0]==0):          
               stair[:,i*bandSize:,0] = firstStep + i/10
            else:
               stair[:,i*bandSize:,0] = colors[1,0]
               
               
            if(colors[1,1]==0):    
            
                stair[:,i*bandSize:,1] = firstStep + i/10
            else:
               stair[:,i*bandSize:,1] = colors[1,1] 
                      
               
            if(colors[1,2]==0):
                
                stair[:,i*bandSize:,2] = firstStep + i/10
            else:
                stair[:,i*bandSize:,2] = colors[1,2]
               
           
           
        
    
    
    # Embbed in big image
    
    pos = int((image.shape[0]-stair.shape[0])/2)
    
    rows,cols,channels = stair.shape
    
    #M = cv2.getRotationMatrix2D((int(cols/2),int(rows/2)),180,1.0)
    #dst = cv2.warpAffine(stair,M,(cols,rows))
    if(invert):
        dst = cv2.flip(stair,1)
    else:
        dst = cv2.flip(stair,0)

    image[pos:pos+stair.shape[0],pos:pos+stair.shape[0],:] = dst  
    
    return image

