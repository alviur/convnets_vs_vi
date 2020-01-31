# -*- coding: utf-8 -*-
"""
Created on Wed Sep 19 11:58:42 2018

@author: root
"""

import numpy as np


def generateGratingInduction(outputSize, height, spatialFreq, colors):

    #Parameters
    outputSize = 128 # Size of the output image
    height = 0.02 # Height of the target
    spatialFreq = 0.05 #size of the inducer patter with respect to image size
    
    
    image = np.ones((outputSize,outputSize,3))
    
    # Colors
    lightInducerR = colors[0,0]
    lightInducerG = colors[0,1]
    lightInducerB = colors[0,2]
    
    darkInducerR = colors[1,0]
    darkInducerG = colors[1,1]
    darkInducerB = colors[1,2]
    
    #Background
    image[:,:,0] = colors[2,0]
    image[:,:,1] = colors[2,1]
    image[:,:,2] = colors[2,2]
    
    vericalPos = np.zeros((2,1))
    beginColumn = round(outputSize*0.05)
    vericalPos[0] = int(round(outputSize*0.05))
    stimulusWidth = outputSize-2*beginColumn
    numBars = round(stimulusWidth/(stimulusWidth*spatialFreq))
    sizeBar = round(stimulusWidth*spatialFreq)
    
    
    vericalPos[1] = int(round(outputSize/2 +(height*outputSize)/2))
    heightStim = int((outputSize-(height*outputSize)-vericalPos[0,0]*2)/2)
    
    # Counters and flags
    cont = 0;
    flagWhite = True;
    flagBlack = True;
    
    for j in range(2):
    
        for i in range(numBars):
           
            if((i%2) == 0):
            
                if(sizeBar*i+sizeBar<=outputSize):
                
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,0] = lightInducerR
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,1] = lightInducerG
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,2] = lightInducerB
                
                else:
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize,0] = lightInducerR
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize,1] = lightInducerG
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize,2] = lightInducerB
        
                  
                
            else:
                if(sizeBar*i+sizeBar<=outputSize):
                
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,0] = darkInducerR;
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,1] = darkInducerG;
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+sizeBar*i+sizeBar,2] = darkInducerB;
                    
                else:
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize] = darkInducerR;
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize] = darkInducerG;
                    image[int(vericalPos[j,0]):int(vericalPos[j,0])+heightStim,beginColumn+ sizeBar*i:beginColumn+outputSize] = darkInducerB;
                
                    
                    
            
      
        
        cont += 1;    
    
    return image
        
