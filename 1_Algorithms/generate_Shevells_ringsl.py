# -*- coding: utf-8 -*-
"""
Created on Wed Sep 26 14:07:03 2018

@author: root
"""

# Libraries
import numpy as np
import cv2
import matplotlib.pyplot as plt

def generateShevellsRings(outputSize,sizeTarget,spatialFreq,colors):
    
    '''
    #Parameters
    outputSize = 128 # Size of the output image
    sizeTarget = 55
    spatialFreq = 0.05
    '''
    extDiameter = 2*sizeTarget
    internalDiameter = 0.1*extDiameter
    
    spaceInbetween = sizeTarget*spatialFreq
    numCircles = (sizeTarget- internalDiameter)/spaceInbetween
     
    '''
    colors = np.zeros((3,3))
    colors[0,0] = 0
    colors[0,1] = 0
    colors[0,2] = 0
    colors[1,0] = 1
    colors[1,1] = 1
    colors[1,2] = 1
    colors[2,0] = 0.5
    colors[2,1] = 0.5
    colors[2,2] = 0.5 
    '''
    
    image = np.ones((outputSize,outputSize,3))
    
    image[:,:,0] = colors[0,0]
    image[:,:,1] = colors[0,1]
    image[:,:,2] = colors[0,2]
    
    cv2.circle(image,(int(outputSize/2),int(outputSize/2)), sizeTarget, (colors[1,0],colors[1,1],colors[1,2]), -1)
    
    for i in range(int(numCircles)):
        
        if((i%2)==0):
            cv2.circle(image,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[1,0],colors[1,1],colors[1,2]), -1)
        else:
            cv2.circle(image,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[0,0],colors[0,1],colors[0,2]), -1)  
            
        if(i==int(numCircles/2) ):
            cv2.circle(image,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[2,0],colors[2,1],colors[2,2]), -1)
    
            
    
    cv2.circle(image,(int(outputSize/2),int(outputSize/2)), int(internalDiameter), (colors[0,0],colors[0,1],colors[0,2]), -1)
    
    
    ## Ring number 2
    
    image2 = np.ones((outputSize,outputSize,3))
    
    image2[:,:,0] = colors[1,0]
    image2[:,:,1] = colors[1,1]
    image2[:,:,2] = colors[1,2]
    
    cv2.circle(image2,(int(outputSize/2),int(outputSize/2)), sizeTarget, (colors[1,0],colors[1,1],colors[1,2]), -1)
    
    for i in range(int(numCircles)):
        
        if((i%2)==0):
            cv2.circle(image2,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[0,0],colors[0,1],colors[0,2]), -1)
        else:
            cv2.circle(image2,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[1,0],colors[1,1],colors[1,2]), -1)  
            
        if(i==int(numCircles/2) ):
            cv2.circle(image2,(int(outputSize/2),int(outputSize/2)), int(extDiameter/2-i*spaceInbetween), (colors[2,0],colors[2,1],colors[2,2]), -1)
    
            
    
    cv2.circle(image2,(int(outputSize/2),int(outputSize/2)), int(internalDiameter), (colors[1,0],colors[1,1],colors[1,2]), -1)
    
    result = np.zeros((2,outputSize,outputSize,3))
    
    result[0,:,:,:] = image
    result[1,:,:,:] = image2
    
    return result