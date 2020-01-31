# -*- coding: utf-8 -*-
"""
Created on Sat Sep 29 17:53:14 2018

@author: root
"""

import numpy as np
import matplotlib.pyplot as plt

path = '/home/alexander/Desktop/CVPR/temp/results/'

results = np.load(path+'jean_denoise_results.npy')
inputa = np.load(path+'x_test.npy')
#labela = np.load(path+'y_test.npy')


for i in range(5):
    
    plt.imshow(results[i,:,:,:])
    plt.show()
    
    plt.imshow(inputa[i,:,:,:])
    plt.show() 
    
    #plt.imshow(labela[i,:,:,:]/255)
    #plt.show()     