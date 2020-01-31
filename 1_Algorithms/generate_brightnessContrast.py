# -*- coding: utf-8 -*-
"""
Created on Wed Sep 12 14:15:32 2018

@author: root
"""
# Libraries
import numpy as np
import matplotlib.pyplot as plt

def generateBrightnessContrast(outputSize, height, colors):
    #Parameters
    #outputSize = 128 # Size of the output image
    #height = 0.1 # Height of the target
    #spatialFreq = 0.05 #size of the inducer patter with respect to image size
    
    # Target position

    
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

  
    
    
    image = np.ones((outputSize,outputSize,3))
    
    image[:,0:round(outputSize/2),0] = lightInducerR
    image[:,0:round(outputSize/2),1] = lightInducerG
    image[:,0:round(outputSize/2),2] = lightInducerB
    
    
    image[:,round(outputSize/2):-1,0] = darkInducerR
    image[:,round(outputSize/2):-1,1] = darkInducerG
    image[:,round(outputSize/2):-1,2] = darkInducerB
    
    
    # Left target
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)-round(height/2):round(outputSize/4)+round(height/2),0] = targetR      
                
                      
    
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)-round(height/2):round(outputSize/4)+round(height/2),1] = targetG        

          
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)-round(height/2):round(outputSize/4)+round(height/2),2] = targetB
          
    # Right target      
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)+round(outputSize/2)-round(height/2):round(outputSize/4)+round(outputSize/2)+round(height/2),0] = targetR      
                
                      
    
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)+round(outputSize/2)-round(height/2):round(outputSize/4)+round(outputSize/2)+round(height/2),1] = targetG        

          
    image[round(outputSize/2)-round(height/2):round(outputSize/2)+round(height/2),
          round(outputSize/4)+round(outputSize/2)-round(height/2):round(outputSize/4)+round(outputSize/2)+round(height/2),2] = targetB          

    return image
    
