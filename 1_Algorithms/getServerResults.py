# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 12:06:43 2018

@author: root
"""

import os
import sys


kernelSize = [3,5,7,11,15]
numKernels = [8,16,32,64,128]
poolingSize = [2,3,5]

dataPath = '/home/agomez/2_CVPR/1_data/'
savePath = '/home/agomez/2_CVPR/0_temp/'
saveHost = '/home/alexander/Desktop/CVPR/temp/results/'



for i in range(len(kernelSize)):
    for j in range(len(numKernels)):    
        
        
        
        
        
        getTxtFile = 'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.txt'
        getArrayFile = 'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.npy'
        
        command = 'scp agomez@10.55.0.168:/home/agomez/2_CVPR/0_temp/'        
        
        os.system(command+savePath+getTxtFile+' '+saveHost+getTxtFile)
        print(command+savePath+getTxtFile+' '+saveHost+getTxtFile)
        os.system(command+savePath+getArrayFile+' '+saveHost+getArrayFile)
        
