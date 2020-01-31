# -*- coding: utf-8 -*-
"""
Created on Mon Nov 19 12:49:35 2018

@author: root
"""

import numpy as np
import cv2


imagePath = '/home/alexander/Desktop/CVPR/2_Data/sup/'
savePath = '/home/alexander/Desktop/CVPR/2_Data/sup/128/'


illusions2 = np.zeros((21,128,128,3))

for i in range(1,22):
    
    image = cv2.resize(cv2.imread(imagePath+str(i)+'.jpg'),(128,128))
    illusions2[i-1,:,:,:] = image
    
    cv2.imwrite(savePath+str(i)+'.jpg',image)

np.save(savePath+'illusionsSup',illusions2)