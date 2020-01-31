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

saveDir = "/home/alexander/Desktop/CVPR/2_Data/"
imagePath = '/home/alexander/Desktop/brightness_per/ILSVRC2014_128X128/'

trainDir = os.listdir(imagePath+'train')
testDir = os.listdir(imagePath+'test')



x_train = np.zeros((len(trainDir),imageSize,imageSize,3))
#ytrain = np.zeros((len(trainDir),imageSize,imageSize,3))

print("Train ready!!!")

trainDir = os.listdir(imagePath+'train')
    
for i in range(len(trainDir)):
    
    s = (random.randint(0,100),random.randint(0,100),random.randint(0,100))
    tempImg = cv2.imread(imagePath+'train/'+trainDir[i])
    #y_test[i,:,:,:] = tempImg    
    x_train[i,:,:,:] =  tempImg + noise_factor * np.random.normal(loc=0.0, scale=255, size=x_train.shape[1:])


x_train = np.clip(x_train, 0., 255.)
np.save(saveDir+'/x_train', x_train)
#np.save(saveDir+'/y_test', y_test)

del x_train#,y_train


'''
x_test = np.zeros((len(testDir),imageSize,imageSize,3))
#y_test = np.zeros((len(testDir),imageSize,imageSize,3))

print("Train ready!!!")

testDir = os.listdir(imagePath+'test')
    
for i in range(len(testDir)):
    
    s = (random.randint(0,100),random.randint(0,100),random.randint(0,100))
    tempImg = cv2.imread(imagePath+'test/'+testDir[i])
    #y_test[i,:,:,:] = tempImg    
    x_test[i,:,:,:] =  tempImg + noise_factor * np.random.normal(loc=0.0, scale=255, size=x_test.shape[1:])


x_test = np.clip(x_test, 0., 255.)
np.save(saveDir+'/x_test', x_test)
#np.save(saveDir+'/y_test', y_test)

del x_test#,y_test
'''    
print("All images were read!!!")  

