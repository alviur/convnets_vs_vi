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


argumens = sys.argv 

print(argumens)

# Paths
path = str(argumens[1])
saveDir = str(argumens[2])

# Parameters
kernel_s = int(argumens[3])
poolSize = int(argumens[4])
numKernels = int(argumens[5])
net = str(argumens[6])
batch_size = 32
epochs = 100


illusions = np.load(path+'ilussions.npy')

print("Data Normalized!!")


input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = BatchNormalization()(x)
x = Activation('relu')(x)
x = MaxPooling2D((poolSize, poolSize), padding='same')(x)
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(x)
x = BatchNormalization()(x)
x = Activation('relu')(x)
encoded = MaxPooling2D((poolSize, poolSize), padding='same')(x)

x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(encoded)
x = BatchNormalization()(x)
x = Activation('relu')(x)
x = UpSampling2D((poolSize, poolSize))(x)
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(x)
x = BatchNormalization()(x)
x = Activation('relu')(x)
x = UpSampling2D((poolSize, poolSize))(x)
x = Conv2D(3, (kernel_s, kernel_s), padding='same')(x)
x = BatchNormalization()(x)
decoded = Activation('sigmoid')(x)

model = Model(input_img, decoded)
model.compile(optimizer='adam', loss='mean_squared_error')



# load pretrained weights# load p 
model.load_weights(saveDir+net)

## Compute PSNR and SSIM en test set
 
outIllusions = model.predict(illusions)  


## Save results

print('Saving Results ...')
np.save(saveDir+'Illusions_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize),outIllusions) 
#np.save(saveDir+'jean_denoise_inputs',x_test) 
#np.save(saveDir+'jean_denoise_labels',y_test) 

#print('Loss function:'+str(score)+' Mean PSNR:'+str(meanPsnr)+' std:'+str(stdPsnr))       
