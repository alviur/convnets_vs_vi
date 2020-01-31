# -*- coding: utf-8 -*-
"""
Created on Mon Oct 29 17:28:37 2018

@author: root
"""

import keras
from keras.models import Sequential
from keras.layers import Dense, Activation, Reshape, Flatten, Dropout
from keras.layers.convolutional import UpSampling2D, Conv2D
from keras.layers.normalization import BatchNormalization
from keras.layers.advanced_activations import LeakyReLU
from keras.optimizers import Adam
from keras.models import load_model
from keras.datasets import cifar10
from keras.layers import Input, Dense, Conv2D, MaxPooling2D, UpSampling2D, BatchNormalization, Activation
from keras.models import Model
from keras.callbacks import EarlyStopping, ModelCheckpoint
import os
import sys
import numpy as np
import tensorflow as tf
from sklearn.model_selection import train_test_split
from keras import backend as K

#from tqdm import tqdm
import numpy as np
import random

import matplotlib.pyplot as plt


def putTargets(posx1,posy1,posx2,posy2,size,data):
    
    data[:,posy1:posy1+size,posx1:posx1+size] =  0.5
    data[:,posy2:posy2+size,posx2:posx2+size] =  0.5
    
    return data
    
    
def customLoss(yTrue,yPred):
    
    
    return K.sum(K.log(generateTarget) - K.log(generateTarget))
    
    
    
    #return K.zeros(1,shape=32)
    
#16384
# Generator Network
def Generator():
  
    model = Sequential()
    model.add(Dense(1024, input_dim=100))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(Dense(128*7*7))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(Reshape((7, 7, 128), input_shape=(128*7*7,)))
    model.add(UpSampling2D((2, 2)))
    model.add(Conv2D(64, kernel_size=(5, 5), padding='same'))
    model.add(BatchNormalization())
    model.add(Activation('relu'))
    model.add(UpSampling2D((2, 2)))
    model.add(Conv2D(1, kernel_size=(5, 5), padding='same'))
    model.add(Activation('tanh'))
    
    model.compile(optimizer='adam', loss=customLoss)
    
    return model
    
# Discriminator network
mainPath = '/home/alexander/Desktop/CVPR/temp/results/6_temp/'
pathIllusions = '/home/alexander/Desktop/CVPR/2_Data/';

# Parameters
kernel_s = 5
poolSize = 2
numKernels = 8
batch_size = 32
num_batches = 1
epochs = 1

input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = Activation('sigmoid')(x)
x = Conv2D(3, (kernel_s, kernel_s), padding='same')(x)
decoded = Activation('sigmoid')(x)


discriminator = Model(input_img, decoded)
discriminator.compile(optimizer='adam', loss='mean_squared_error')

discriminator.load_weights(mainPath + 'cnn1_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.hdf5')
   
   
# Parameters for    
batch_size = 32
input_size = 100    


generator = Generator()

for epoch in range(1):
    
    for index in range(1):

        # Generative data
        noise = np.random.uniform(-1, 1, size=[batch_size, input_size])
        y = np.zeros(batch_size)
        
        # Generate data        
        generated_data = generator.predict_on_batch(noise) 
        
        generateTarget = putTargets(14,8,14,24,3,generated_data)
        
        # Use discriminator
        #outIllusions = discriminator.predict(generated_data)  
        
        y = np.zeros(batch_size)
        g_loss = generator.train_on_batch(x=noise, y=y)
        


        

#generated_data = generator.predict_on_batch(noise)    

#img = generated_images = generator.predict(noise)