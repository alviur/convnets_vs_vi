# -*- coding: utf-8 -*-
"""
Created on Tue Sep 25 09:00:37 2018

@author: root
"""
# Libraries
import keras
from keras.models import load_model
from keras.datasets import cifar10
from keras.layers import Input, Dense, Conv2D, MaxPooling2D, UpSampling2D, BatchNormalization, Activation
from keras.models import Model
from keras.callbacks import EarlyStopping, ModelCheckpoint
from keras.optimizers import Adam
import os
import sys
import numpy as np
import tensorflow as tf
from sklearn.model_selection import train_test_split
from keras import backend as K
from skimage.measure import compare_ssim as ssim
from skimage.measure import compare_psnr as psnr
import time
import scipy.io as sio



               


argumens = sys.argv 

print(argumens)

# Paths
pathIllusions = '/home/alexander/Desktop/CVPR/2_Data/'
pathModel = '/home/alexander/Desktop/CVPR/temp/results/1_temp_blur_3/'
#pathModel = '/home/alexander/Desktop/CVPR/temp/results/1_temp_haze/'
#pathModel = '/home/alexander/Desktop/CVPR/temp/results/1_temp_CC/'

saveDir = '/home/alexander/Desktop/CVPR/temp/matlab/MaTLAB_blur_gauss/'
#saveDir = '/home/alexander/Desktop/CVPR/temp/1LayerResults_Dehaze/'
#saveDir = '/home/alexander/Desktop/CVPR/temp/1LayerResults_CC/'


# Parameters
kernel_s = 5
poolSize = 2
numKernels = 8
batch_size = 32
epochs = 100


net = 'cnn1_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.hdf5'


illusions = np.load(pathIllusions+'ilussions.npy')

noise_factor = 0.1
illusions_noise = illusions + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=illusions.shape)


print("Data Normalized!!")


input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = Activation('sigmoid')(x)
x = Conv2D(3, (kernel_s, kernel_s), padding='same')(x)
decoded = Activation('sigmoid')(x)

model = Model(input_img, decoded)
model.compile(optimizer='adam', loss='mean_squared_error')

# load pretrained weights# load p 
model.load_weights(pathModel+net)

## Compute PSNR and SSIM en test set
 
outIllusions = model.predict(illusions)  
outIllusionsNoise = model.predict(illusions_noise)  

## Save results

print('Saving Results ...')
np.save(saveDir+'Illusions_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize),outIllusions) 
np.save(saveDir+'IllusionsNoise_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize),outIllusionsNoise) 
sio.savemat(saveDir+'Illusions_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.mat', {'illusions':outIllusions})
sio.savemat(saveDir+'IllusionsNoise_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.mat', {'illusions':outIllusionsNoise})

#np.save(saveDir+'jean_denoise_inputs',x_test) 
#np.save(saveDir+'jean_denoise_labels',y_test) 

#print('Loss function:'+str(score)+' Mean PSNR:'+str(meanPsnr)+' std:'+str(stdPsnr))       
