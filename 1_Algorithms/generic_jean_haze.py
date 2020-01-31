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
from random import randint



argumens = sys.argv 

print(argumens)

# Paths
path = str(argumens[1])
saveDir = str(argumens[2])

# Parameters
kernel_s = int(argumens[3])
poolSize = int(argumens[4])
numKernels = int(argumens[5])
batch_size = 32
epochs = 100


inputImg = np.load(path+'hazy.npy')
outputImg = np.load(path+'clean.npy')
illusions = np.load(path+'ilussions.npy')

print("Data loaded!!")


x = inputImg.astype('float32')
y = outputImg.astype('float32')
#x_train /= 255
#x_test /= 255
x /= 255
y /= 255


X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.33, random_state=randint(0, 100))


# divide x_test into validation and test
x_val = X_test[:2000]
y_val = y_test[:2000]
x_test = X_test[2000:]
y_test = y_test[2000:]


print("Data Normalized!!")

input_img = Input(shape=(128, 128, 3))
x = Conv2D(numKernels, (kernel_s, kernel_s), padding='same')(input_img)
x = Activation('sigmoid')(x)
x = Conv2D(3, (kernel_s, kernel_s), padding='same')(x)
decoded = Activation('sigmoid')(x)

model = Model(input_img, decoded)
model.compile(optimizer='adam', loss='mean_squared_error')


es_cb = EarlyStopping(monitor='val_loss', patience=2, verbose=1, mode='auto')
chkpt = saveDir + 'cnn1_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.hdf5'
cp_cb = ModelCheckpoint(filepath = chkpt, monitor='val_loss', verbose=1, save_best_only=True, mode='auto')

history = model.fit(X_train, y_train,
                    batch_size=batch_size,
                    epochs=epochs,
                    verbose=1,
                    validation_data=(x_val, y_val),
                    callbacks=[es_cb, cp_cb],
                    shuffle=True)
                    
                    
score = model.evaluate(x_test, y_test, verbose=1)    


## Compute PSNR and SSIM en test set
  
out = model.predict(x_test)*255  
outIllusions = model.predict(illusions)  

performance = np.zeros((x_test.shape[0],2))

# PSNR
for i in range(x_test.shape[0]):    
    
    performance[i,0] = psnr(y_test[i,:,:,:]*255,out[i,:,:,:],data_range=255)
    
# SSIM
for i in range(x_test.shape[0]):    
    
    performance[i,1] = ssim(y_test[i,:,:,:]*255, out[i,:,:,:], data_range=255, gaussian_weights=True
    , sigma = 1.5, use_sample_covariance=False,multichannel=True)


## Save results
file = open(saveDir+'Illusions_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize)+'.txt','w')
file.write('Mean PSNR'+str(np.mean(performance[:,0]))+'-'+str(np.std(performance[:,0]))) 
file.write('Mean SSIM'+str(np.mean(performance[:,1]))+'-'+str(np.std(performance[:,1]))) 
file.write(chkpt)
file.close() 

#np.save(saveDir+'jean_denoise_results',out) 
print('Saving Results ...')
np.save(saveDir+'Illusions_r'+str(kernel_s)+'_nk'+str(numKernels)+'_p'+str(poolSize),outIllusions) 
#np.save(saveDir+'jean_denoise_inputs',x_test) 
#np.save(saveDir+'jean_denoise_labels',y_test) 

#print('Loss function:'+str(score)+' Mean PSNR:'+str(meanPsnr)+' std:'+str(stdPsnr))                    