# -*- coding: utf-8 -*-
"""
Created on Fri Nov  2 10:28:34 2018

@author: root
"""

import numpy as np
import cv2
import matplotlib.pyplot as plt


pathClean = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/resized_haze/clean/'
pathHazy = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/resized_haze/hazy/'
savePath = '/home/alexander/Desktop/CVPR/2_Data/D-HAZY_DATASET/resized_haze/'

clean = np.zeros((13041,128,128,3))


for i in range(1,13041):
    
    clean[i,:,:,:] = cv2.imread(pathClean+str(i)+'.png')
    
    
np.save(savePath+'clean',clean)


del clean


hazy = np.zeros((13041,128,128,3))


for i in range(1,13041):
    
    hazy[i,:,:,:] = cv2.imread(pathHazy+str(i)+'.png')
    
    
np.save(savePath+'hazy',hazy) 
del hazy
    