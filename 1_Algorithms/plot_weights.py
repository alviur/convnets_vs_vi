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
import cv2
import matplotlib.pyplot as plt
import scipy.io as sio



# Paths
pathIllusions = '/home/alexander/Desktop/CVPR/2_Data/'
pathModel = '/home/alexander/Desktop/CVPR/temp/results/6_temp/'
#pathModel = '/home/alexander/Desktop/CVPR/temp/results/1_temp_haze/'
#pathModel = '/home/alexander/Desktop/CVPR/temp/results/1_temp_CC/'

saveDir = '/home/alexander/Desktop/CVPR/temp/results2/1layerDenoise/'
#saveDir = '/home/alexander/Desktop/CVPR/temp/1LayerResults_Dehaze/'
#saveDir = '/home/alexander/Desktop/CVPR/temp/1LayerResults_CC/'


# Parameters
kernel_s = 5
poolSize = 2
numKernels = 8
batch_size = 32
epochs = 100


input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = Activation('sigmoid')(x)
x = Conv2D(3, (kernel_s, kernel_s), padding='same')(x)
decoded = Activation('sigmoid')(x)
model = Model(input_img, decoded)
model.compile(optimizer='adam', loss='mean_squared_error')

# load pretrained weights# load p 
model.load_weights(pathModel+net)

# Extract model weights
x1w = model.get_weights()

# Plot sizes
#print((x1w[0].shape),x1w[1].shape,x1w[2].shape,x1w[3].shape)
print(pathModel+net)

# Put in Numpy vectors
layer1 = x1w[0]# [5, 5, 3, 8]
layer1Bias = x1w[1] # [8]

layer2 = x1w[2]# [5, 5, 8, 3]
layer2Bias = x1w[3]# [3]

# Sample plot
plt.imshow(layer1[:,:,:,0])
plt.show()



'''
# Save as Matlab arrays
matlabSave = '/'
sio.savemat(matlabSave+'/layer1.mat',
                {'layer1': layer1})
sio.savemat(matlabSave+'/layer1Bias.mat',
                {'layer1Bias': layer1Bias})
sio.savemat(matlabSave+'/layer2.mat',
                {'layer2': layer2})
sio.savemat(matlabSave+'/layer2.mat',
                {'layer2': layer2})
'''