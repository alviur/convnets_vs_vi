# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 10:28:34 2018

@author: root
"""

import numpy as np
import cv2
import matplotlib.pyplot as plt


pathClean = '/home/alexander/Desktop/CVPR/2_Data/output/'
pathHazy = '/home/alexander/Desktop/CVPR/2_Data/input/'
savePath = '/home/alexander/Desktop/CVPR/2_Data/CC_train/'

clean = np.zeros((50000,128,128,3),dtype=np.int16)



for i in range(1,50000):
    
    clean[i,:,:,:] = cv2.imread(pathClean+str(i)+'.png')
    
    
np.save(savePath+'output',clean)


del clean


hazy = np.zeros((50000,128,128,3),dtype=np.int16)


for i in range(1,50000):
    
    hazy[i,:,:,:] = cv2.imread(pathHazy+str(i)+'.png')
    
    
np.save(savePath+'input',hazy) 
#del hazy
    