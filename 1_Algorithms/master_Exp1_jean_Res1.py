# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 12:06:43 2018

@author: root
"""

import os
import sys


kernelSize = [3,5]
numKernels = [8,32,64]
poolingSize = [2]

dataPath = '/home/agomez/2_CVPR/1_data/'
savePath = '/home/agomez/2_CVPR/1_temp_Res1/'



for i in range(len(poolingSize)):
    
    
    
    command = 'python3 generic_jean_Res1.py '+dataPath+' '+savePath+' '+str(kernelSize[0])+' '+str(poolingSize[i])+' '+str(numKernels[0])
    print(command)
    
    print(savePath+'Illusions_r'+str(kernelSize[0])+'_nk'+str(numKernels[0])+'_p'+str(poolingSize[i])+'.txt')
    
    os.system(command)
