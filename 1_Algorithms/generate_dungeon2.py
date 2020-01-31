# -*- coding: utf-8 -*-
"""
Created on Wed Sep 19 10:50:12 2018

@author: root
"""

# Libraries
import numpy as np
import matplotlib.pyplot as plt

def generateDungeon2(outputSize0,height,spatialFreq,posxTarget,posyTarget, colors):
    
    
    # Parameters
    #outputSize = 128;
    #height = 0.4 # Height of the target
    #spatialFreq = 0.05;
    outputSize =outputSize0
    withGrid = round(round(spatialFreq*outputSize)/3);
    stepSize = round(spatialFreq*outputSize);
    #posxTarget = 64
    #posyTarget = 64
    
    # Colors
    lightInducerR = colors[0,0]
    lightInducerG = colors[0,1]
    lightInducerB = colors[0,2]
    
    darkInducerR = colors[1,0]
    darkInducerG = colors[1,1]
    darkInducerB = colors[1,2]
    
    targetR = colors[2,0]
    targetG = colors[2,1]
    targetB = colors[2,2]
    
    
    numBars = round(outputSize/(outputSize*spatialFreq));
    sizeBar = round(outputSize*spatialFreq);
    
    #heightPos = 64;
    heightPix = round((height*outputSize)/2);
    image = np.ones((outputSize,outputSize,3))
    
    
    
    # First image
    image[:,:,0] = lightInducerR
    image[:,:,1] = lightInducerG
    image[:,:,2] = lightInducerB
    
    # Target 
    image[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,0] = targetR
    image[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,1] = targetG
    image[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,2] = targetB
    
    [rows, columns, numberOfColorChannels] = image.shape;
    
    for row in range(0,rows,stepSize):
        
        image[row:row+withGrid,:, 0] = darkInducerR;
        image[row:row+withGrid,:, 1] = darkInducerG;
        image[row:row+withGrid,:, 2] = darkInducerB;
    
    for col in range(0,columns,stepSize):
        
        image[:, col:col+withGrid,0] = darkInducerR;
        image[:, col:col+withGrid,1] = darkInducerG;
        image[:, col:col+withGrid,2] = darkInducerB;
        
        
    image[image==1] = 0;  
    image[image==0.5] = 1;        
    
        
    # Second image 
    image2 = np.zeros((outputSize,outputSize,3))    
        
    image2[:,:,0] = darkInducerR
    image2[:,:,1] = darkInducerG
    image2[:,:,2] = darkInducerB
    
    # Target 
    image2[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,0] = targetR
    image2[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,1] = targetG
    image2[posyTarget-heightPix:posyTarget+heightPix,posxTarget-heightPix:posxTarget+heightPix,2] = targetB
    
    
    [rows, columns, numberOfColorChannels] = image2.shape;
    
    for row in range(0,rows,stepSize):
        
        image2[row:row+withGrid,:, 0] = lightInducerR;
        image2[row:row+withGrid,:, 1] = lightInducerG;
        image2[row:row+withGrid,:, 2] = lightInducerB;
    
    for col in range(0,columns,stepSize):
        
        image2[:, col:col+withGrid,0] = lightInducerR;
        image2[:, col:col+withGrid,1] = lightInducerG;
        image2[:, col:col+withGrid,2] = lightInducerB;
        
    image2[image2==1] = 0;  
    image2[image2==0.5] = 1;

      
    if(outputSize0>300):
        
        resutls = np.zeros((2,outputSize0,outputSize0,3))
        resutls[0,64:192,64:192,:] = image
        resutls[1,64:192,64:192,:] = image2
        
        return resutls
        
    else:          

      
        resutls = np.zeros((2,outputSize,outputSize,3))
        resutls[0,:,:,:] = image
        resutls[1,:,:,:] = image2
        return resutls
    
