# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 08:47:59 2018

@author: root
"""

# Libraries
import numpy as np
import cv2 
import matplotlib.pyplot as plt

def generateLuminanceGradient(outputSize,sizeTarget,colors):

    #Parameters
    #outputSize = 128 # Size of the output image
        
    outputSize2 = int(outputSize*1.5)
    
    image = np.zeros((outputSize,outputSize2,3))
    
    gradient = np.linspace(0, 1, num=outputSize2)
    

    
    for i in range(outputSize2):
        
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
            
            
    
    
    # Positions
    pos = np.zeros((5,2)) 
    pos[0,0] = int(outputSize/2)
    pos[0,1] = int(outputSize/2)
    pos[1,0] = int((outputSize/3)/2)
    pos[1,1] = int((outputSize/3)/2)
    pos[2,1] = int((outputSize/3)/2)
    pos[2,0] = (outputSize2/3)*2 + (outputSize/3)/2 
    pos[3,1] = (outputSize/3)*2 + (outputSize/3)/2
    pos[3,0] = int((outputSize/3)/2)
    pos[4,1] = (outputSize/3)*2 + (outputSize/3)/2
    pos[4,0] = (outputSize2/3)*2 + (outputSize/3)/2 
    
    if(sizeTarget<1):
        
        image[int(pos[0,0]):int(pos[0,0])+1,int(pos[0,1]):int(pos[0,1])+1,:] = colors[1,:]
        image[int(pos[1,0]):int(pos[1,0])+1,int(pos[1,1]):int(pos[1,1])+1,:] = colors[1,:]
        image[int(pos[2,0]):int(pos[2,0])+1,int(pos[2,1]):int(pos[2,1])+1,:] = colors[1,:]
        image[int(pos[3,0]):int(pos[3,0])+1,int(pos[3,1]):int(pos[3,1])+1,:] = colors[1,:]
        image[int(pos[3,0])+int(pos[3,0])+1,int(pos[4,1]):int(pos[4,1])+1,:] = colors[1,:]
        
        
        
    else:
    
        #cv2.circle(image,(int(pos[0,0]),int(pos[0,1])), sizeTarget, colors[1,:],-1)#middle
        cv2.circle(image,(int(pos[1,0]),int(pos[1,1])), sizeTarget, colors[1,:],-1)
        cv2.circle(image,(int(pos[2,0]),int(pos[2,1])), sizeTarget, colors[1,:],-1)
        cv2.circle(image,(int(pos[3,0]),int(pos[3,1])), sizeTarget, colors[1,:],-1)
        cv2.circle(image,(int(pos[4,0]),int(pos[4,1])), sizeTarget, colors[1,:],-1)
    
    return image
    
