# -*- coding: utf-8 -*-
"""
Created on Thu Oct  4 12:06:43 2018

@author: root
"""

import os
import sys


kernelSize = [3,5,7,11,15]
numKernels = [8,16,32,64,128]
poolingSize = [2,4,6]

dataPath = '/home/agomez/2_CVPR/1_data/'
savePath = '/home/agomez/2_CVPR/0_temp/'

cont = 0

for i in range(len(kernelSize)):
    for j in range(len(numKernels)):  
        
        
        results = []
        with open('nets.txt') as inputfile:
            for line in inputfile:
                results.append(line.strip().split(','))   
        
        str1 = str(results[cont])
        
        cont += 1
       
        
        
        command = 'python3 Testgeneric_CNN1.py '+dataPath+' '+savePath+' '+str(kernelSize[i])+' '+str(poolingSize[0])+' '+str(numKernels[j])+' '+str1[2:-2]
        print(command)
        
        print(savePath+'Illusions_r'+str(kernelSize[i])+'_nk'+str(numKernels[j])+'_p'+str(poolingSize[0])+'.txt')
        
        os.system(command)

