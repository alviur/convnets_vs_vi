# -*- coding: utf-8 -*-
"""
Created on Thu Sep 20 08:47:59 2018

@author: root
"""

# Libraries
import numpy as np
import cv2 
import matplotlib.pyplot as plt

def generateLuminanceGradient2(outputSize,sizeTarget,colors):

    #Parameters
    #outputSize = 128 # Size of the output image
        
    
    
    image = np.zeros((outputSize,outputSize,3))
    
    gradient = np.linspace(0, 1, num=outputSize)
    
    
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
    
    if(sizeTarget<1):
        
        #image[int(pos[0,0]),int(pos[0,1]),:] = colors[1,:]
        image[int(pos[1,0]):int(pos[1,0])+1,int(pos[1,1]):int(pos[1,1])+1,:] = colors[1,:]
        image[int(pos[2,0]):int(pos[2,0])+1,int(pos[2,1]):int(pos[2,1])+1,:] = colors[1,:]
        #image[int(pos[3,0]),int(pos[3,1]),:] = colors[1,:]
        #image[int(pos[3,0]),int(pos[4,1]),:] = colors[1,:]
        
        
        
    else:
    
        cv2.circle(image,(int(pos[1,0]),int(pos[1,1])), sizeTarget, (1,1,1),-1)
        cv2.circle(image,(int(pos[2,0]),int(pos[2,1])), sizeTarget, (1,1,1),-1)  
    
    #cv2.circle(image,(int(pos[0,0]),int(pos[0,1])), sizeTarget, (1,1,1),-1)
    #cv2.circle(image,(int(pos[1,0]),int(pos[1,1])), sizeTarget, (1,1,1),-1)
    #cv2.circle(image,(int(pos[2,0]),int(pos[2,1])), sizeTarget, (1,1,1),-1)
    #cv2.circle(image,(int(pos[3,0]),int(pos[3,1])), sizeTarget, (1,1,1),-1)
    #cv2.circle(image,(int(pos[4,0]),int(pos[4,1])), sizeTarget, (1,1,1),-1)
    
    return image
    
