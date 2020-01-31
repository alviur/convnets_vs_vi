# -*- coding: utf-8 -*-
"""
Created on Wed Sep 26 16:06:16 2018

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
import numpy as np



# Paths
path = '/home/agomez/2_CVPR/1_data/'
saveDir = '/home/agomez/2_CVPR/0_temp/'



batch_size = 32
epochs = 100

#x_train = np.load(path+'x_train.npy')
y_train = np.load(path+'y_train.npy')
#x_test = np.load(path+'x_test.npy')
y_test = np.load(path+'y_test.npy')
illusions = np.load(path+'ilussions.npy')

print("Data loaded!!")

# normalize data# norma 
y_train = y_train.astype('float32')
y_test = y_test.astype('float32')

#x_train /= 255
#x_test /= 255
y_train /= 255
y_test /= 255


# divide x_test into validation and test
y_val = y_train[:7000]
y_test = y_test[7000:]


# Adde noise
noise_factor = 0.1
x_train = y_train + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=y_train.shape) 
x_test = y_test + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=y_test.shape) 
x_val_noisy = y_val + noise_factor * np.random.normal(loc=0.0, scale=1.0, size=y_val.shape) 


x_train = np.clip(x_train, 0., 1.)
y_test = np.clip(y_test, 0., 1.)

print("Data Normalized!!")

# Arquitecture

input_img = Input(shape=(128, 128, 3))
x = Conv2D(24, (5, 5), padding='same')(input_img)
x = Activation('sigmoid')(x)
x = Conv2D(24, (5, 5), padding='same')(x)
x = Activation('sigmoid')(x)
x = Conv2D(24, (5, 5), padding='same')(x)
x = Activation('sigmoid')(x)
x = Conv2D(24, (5, 5), padding='same')(x)
x = Activation('sigmoid')(x)
x = Conv2D(3, (5, 5), padding='same')(x)
decoded = Activation('sigmoid')(x)


model = Model(input_img, decoded)
model.compile(optimizer='adam', loss='mean_squared_error')

print("Arquitecture ready!!")

es_cb = EarlyStopping(monitor='val_loss', patience=2, verbose=1, mode='auto')
chkpt = saveDir + 'jean_denoise_weights.{epoch:02d}-{loss:.2f}-{val_loss:.2f}.hdf5'
cp_cb = ModelCheckpoint(filepath = chkpt, monitor='val_loss', verbose=1, save_best_only=True, mode='auto')

print("Lets go!! Training...")

history = model.fit(x_train, y_train,
                    batch_size=batch_size,
                    epochs=epochs,
                    verbose=1,
                    validation_data=(x_test, y_test),
                    callbacks=[es_cb, cp_cb],
                    shuffle=True)
                    
score = model.evaluate(x_test, y_test, verbose=1)      
out = model.predict(x_test)  
outIllusions = model.predict(illusions)  

print(score) 
print('Saving Results ...')
     
np.save(saveDir+'jean_denoise_results',out) 
np.save(saveDir+'jean_Illusions_results',outIllusions) 
np.save(saveDir+'jean_denoise_inputs',x_test) 
np.save(saveDir+'jean_denoise_labels',y_test) 