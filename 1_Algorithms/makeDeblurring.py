# -*- coding: utf-8 -*-
"""
Created on Mon Sep 10 11:32:35 2018

@author: root
"""

import numpy as np
import cv2
import os
import random
import matplotlib.pyplot as plt

imageSize = 128
m = (0,0,0)
noise_factor = 0.1

saveDir = "/home/alexander/Desktop/CVPR/2_Data/Deblurring_lin10/"
imagePath = '/home/alexander/Desktop/CVPR/2_Data/Deblurring_lin10/'

trainDir = os.listdir(imagePath+'inputs_lin10')
testDir = os.listdir(imagePath+'outputs_lin10')


outputIm = np.zeros((len(trainDir),imageSize,imageSize,3),dtype=np.int16)
contIm = 0

print("Train ready!!!")

    
for i in trainDir:
    
    outputIm[contIm,:,:,:] = cv2.resize(cv2.imread(imagePath+'inputs_lin10/'+i),(128,128))
    contIm += 1
    print(contIm)

np.save(saveDir+'inputs', outputIm)
#np.save(saveDir+'/y_test', y_test)

del outputIm#,y_train
#
#inputIm = np.zeros((len(trainDir),imageSize,imageSize,3),dtype=np.int16)
#contIm = 0
#
#print("Train ready!!!")
#
#    
#for i in trainDir:
#    
#    inputIm[contIm,:,:,:] = cv2.resize(cv2.imread(imagePath+'outputs_lin10/b_'+i),(128,128))
#    contIm += 1
#    print(contIm)
#
#np.save(saveDir+'outputs', inputIm)
##np.save(saveDir+'/y_test', y_test)
#
#del inputIm#,y_train


print("All images were read!!!")  

