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
from keras import backend as K
import time
import matplotlib.pyplot as plt
import scipy.io as sio





mainPath = '/home/alexander/Desktop/CVPR/temp/results/1_temp/'
pathIllusions = '/home/alexander/Desktop/CVPR/2_Data/';

# Parameters
kernel_s = 5
poolSize = 2
numKernels = 64
batch_size = 32
epochs = 100



input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = BatchNormalization()(x)
x = Activation('relu')(x)
x = MaxPooling2D((poolSize, poolSize), padding='same')(x)
x = Conv2D(numKernels, (5, 5), padding='same')(x)
x = BatchNormalization()(x)
x = Activation('relu')(x)
encoded = MaxPooling2D((poolSize, poolSize), padding='same')(x)

x = Conv2D(numKernels, (5, 5), padding='same')(encoded)
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

model.load_weights(mainPath + 'cnn1_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.hdf5')


## Load Illusions

illusions = np.load(pathIllusions +'ilussions.npy')
  
 
outIllusions = model.predict(illusions)  


sio.savemat('/home/alexander/Desktop/CVPR/temp/matlab/HHillusions.mat', {'illusions':outIllusions})
