# -*- coding: utf-8 -*-
"""
Created on Mon Oct  1 15:18:43 2018

@author: root
"""

import scipy.io as sio
import numpy as np


#paths 
sourcePath = '/home/alexander/Desktop/CVPR/temp/results/'
savePath = '/home/alexander/Desktop/CVPR/temp/matlab/'


pythonFile = np.load(sourcePath+'illusions.npy')
sio.savemat(savePath+'illusions.mat', {'illusions':pythonFile})
#del pythonFile


pythonFile = np.load('/home/alexander/Desktop/CVPR/2_Data/'+'ilussions.npy')
sio.savemat(savePath+'illusionsInput.mat', {'illusionsInput':pythonFile})