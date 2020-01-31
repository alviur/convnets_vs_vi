# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 12:06:43 2018

@author: root
"""

import os
import sys
import scipy.io as sio
import numpy as np


#kernelSize = [3,5,7,11,15]
kernelSize = [5]
#numKernels = [8,16,32,64,128]
numKernels = [8]
poolingSize = [2,4,8]

matPath = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB_blur_gauss/'
savePath = '/home/alexander/Desktop/CVPR/temp/results/1_temp_blur_3/'



for i in range(len(kernelSize)):
    for j in range(len(numKernels)):    
        
        
        print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy')
        
        path = 'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])
        
        pythonFile = np.load(savePath+path+'.npy')
        sio.savemat(matPath+path+'.mat', {'illusions':pythonFile})
        



#for i in range(len(kernelSize)):
#    for j in range(len(poolingSize)):    
#        
#        
#        print(savePath+'Illusions_r'+str(kernelSize[0])+'_nk'+str(numKernels[0])+'_p'+str(poolingSize[j])+'.npy')
#        
#        path = 'Illusions_r'+str(kernelSize[0])+'_nk'+str(numKernels[0])+'_p'+str(poolingSize[j])
#        
#        pythonFile = np.load(savePath+path+'.npy')
#        sio.savemat(matPath+path+'.mat', {'illusions':pythonFile})
        



