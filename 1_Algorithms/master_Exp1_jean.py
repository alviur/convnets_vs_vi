# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 12:06:43 2018

@author: root
"""

import os
import sys


kernelSize = [3,5]
numKernels = [8,32,64]
poolingSize = [2,4,8]

dataPath = '/home/agomez/2_CVPR/1_data/'
savePath = '/home/agomez/2_CVPR/1_temp_haze/'



for i in range(len(kernelSize)):
    for j in range(len(numKernels)):    
        
        
        
        command = 'python3 generic_jean_haze.py '+dataPath+' '+savePath+' '+str(kernelSize[i])+' '+str(poolingSize[0])+' '+str(numKernels[j])
        print(command)
        
        print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.txt')
        
        os.system(command)
