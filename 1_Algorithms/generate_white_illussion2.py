# -*- coding: utf-8 -*-
"""
Created on Wed Sep 12 14:15:32 2018

@author: root
"""
# Libraries
import numpy as np
import matplotlib.pyplot as plt

def generateWhiteTarget(outputSize, height, spatialFreq, colors):
    #Parameters
    #outputSize = 128 # Size of the output image
    #height = 0.1 # Height of the target
    #spatialFreq = 0.05 #size of the inducer patter with respect to image size
    
    # Target position
    heightPos = round(outputSize/2)
    heightPix = round((height*outputSize)/2)
    
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
    
    
    firstTarget = 0.23    
    secondTarget = 0.6
    
    
    if(spatialFreq==0.09):
        
        firstTarget = 0.1
    
    
    
    
    image = np.zeros((outputSize,outputSize,3),dtype=np.int8)
    numBars = round(outputSize/(outputSize*spatialFreq))
    sizeBar = round(outputSize*spatialFreq)
    if(numBars*sizeBar<outputSize-20):
        numBars += 28
        firstTarget = 0.3
        secondTarget = 0.7
        
    
    
    # Counters and flags
    cont = 0;
    flagWhite = True;
    flagBlack = True;
    
    for i in range(numBars+2):
       
        if((i%2) == 0):
 
            
            if(cont>=firstTarget*numBars and flagWhite):
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,0]=1
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,1]=1
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,2]=1
                flagWhite = False            
            
        else:

            
            
            if(cont>=secondTarget*numBars and flagBlack and cont<0.9*numBars):
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,0]=1
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,1]=1
                image[sizeBar*i:sizeBar*i+sizeBar,sizeBar*i:sizeBar*i+sizeBar,2]=1
                flagBlack = False            
                    
            
      
        
        cont += 1;    
        
    return image