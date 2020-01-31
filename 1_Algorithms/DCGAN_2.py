# -*- coding: utf-8 -*-
"""
Created on Mon Oct 29 19:21:26 2018

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
import tensorflow as tf
import numpy as np
import cv2
import random
import scipy.misc
#from utils import *

#slim = tf.contrib.slim

HEIGHT, WIDTH, CHANNEL = 128, 128, 3
BATCH_SIZE = 64

def putTargets(posx1,posy1,posx2,posy2,size,data):
    
    mask = np.ones((BATCH_SIZE,HEIGHT, WIDTH, CHANNEL),dtype=np.float32)
    mask2 = np.zeros((BATCH_SIZE,HEIGHT, WIDTH, CHANNEL),dtype=np.float32)
    mask[:,posy1:posy1+size,posx1:posx1+size,:] = 0.0
    mask2[:,posy1:posy1+size,posx1:posx1+size,:] = 0.5
    
    maskT = tf.convert_to_tensor(mask)
    maskT2 = tf.convert_to_tensor(mask2)
    
    
    dataTarget = tf.multiply(data,maskT)
    dataTarget = tf.add(dataTarget,maskT2)    
    
    #data[:,posy1:posy1+size,posx1:posx1+size] =  0.5
    #data[:,posy2:posy2+size,posx2:posx2+size] =  0.5
    
    return dataTarget
    
def evalInDiscriminator(posx1,posy1,posx2,posy2,size,fake_image):
    
    fake_result = discriminator.predict(tf.Session().run(fake_image))  
    
    replication = abs(fake_result[:,posy1:posy1+size,posx1:posx1+size,:] - fake_result[:,posy1:posy1+size,posx1:posx1+size,:]).sum()
    
    
    return replication
    
   
   


def generator(input, random_dim, is_train, reuse=False):
    c4, c8, c16, c32, c64 = 512, 256, 128, 64, 32 # channel num
    s4 = 4
    output_dim = CHANNEL  # RGB image
    with tf.variable_scope('gen') as scope:
        if reuse:
            scope.reuse_variables()
        w1 = tf.get_variable('w1', shape=[random_dim, s4 * s4 * c4], dtype=tf.float32,
                             initializer=tf.truncated_normal_initializer(stddev=0.02))
        b1 = tf.get_variable('b1', shape=[c4 * s4 * s4], dtype=tf.float32,
                             initializer=tf.constant_initializer(0.0))
        flat_conv1 = tf.add(tf.matmul(input, w1), b1, name='flat_conv1')
         #Convolution, bias, activation, repeat! 
        conv1 = tf.reshape(flat_conv1, shape=[-1, s4, s4, c4], name='conv1')
        bn1 = tf.contrib.layers.batch_norm(conv1, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn1')
        act1 = tf.nn.relu(bn1, name='act1')
        # 8*8*256
        #Convolution, bias, activation, repeat! 
        conv2 = tf.layers.conv2d_transpose(act1, c8, kernel_size=[5, 5], strides=[2, 2], padding="SAME",
                                           kernel_initializer=tf.truncated_normal_initializer(stddev=0.02),
                                           name='conv2')
        bn2 = tf.contrib.layers.batch_norm(conv2, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn2')
        act2 = tf.nn.relu(bn2, name='act2')
        # 16*16*128
        conv3 = tf.layers.conv2d_transpose(act2, c16, kernel_size=[5, 5], strides=[2, 2], padding="SAME",
                                           kernel_initializer=tf.truncated_normal_initializer(stddev=0.02),
                                           name='conv3')
        bn3 = tf.contrib.layers.batch_norm(conv3, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn3')
        act3 = tf.nn.relu(bn3, name='act3')
        # 32*32*64
        conv4 = tf.layers.conv2d_transpose(act3, c32, kernel_size=[5, 5], strides=[2, 2], padding="SAME",
                                           kernel_initializer=tf.truncated_normal_initializer(stddev=0.02),
                                           name='conv4')
        bn4 = tf.contrib.layers.batch_norm(conv4, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn4')
        act4 = tf.nn.relu(bn4, name='act4')
        # 64*64*32
        conv5 = tf.layers.conv2d_transpose(act4, c64, kernel_size=[5, 5], strides=[2, 2], padding="SAME",
                                           kernel_initializer=tf.truncated_normal_initializer(stddev=0.02),
                                           name='conv5')
        bn5 = tf.contrib.layers.batch_norm(conv5, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn5')
        act5 = tf.nn.relu(bn5, name='act5')
        
        #128*128*3
        conv6 = tf.layers.conv2d_transpose(act5, output_dim, kernel_size=[5, 5], strides=[2, 2], padding="SAME",
                                           kernel_initializer=tf.truncated_normal_initializer(stddev=0.02),
                                           name='conv6')
        # bn6 = tf.contrib.layers.batch_norm(conv6, is_training=is_train, epsilon=1e-5, decay = 0.9,  updates_collections=None, scope='bn6')
        act6 = tf.nn.tanh(conv6, name='act6')
        return act6


# Discriminator network
#mainPath = '/home/alexander/Desktop/CVPR/temp/results/6_temp/'
mainPath = '/home/agomez/2_CVPR/6_temp/'
#pathIllusions = '/home/alexander/Desktop/CVPR/2_Data/';

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
   
     

random_dim = 100

with tf.variable_scope('input'):
    #real and fake image placholders
    real_image = tf.placeholder(tf.float32, shape = [None, HEIGHT, WIDTH, CHANNEL], name='real_image')
    random_input = tf.placeholder(tf.float32, shape=[None, random_dim], name='rand_input')
    is_train = tf.placeholder(tf.bool, name='is_train')

# wgan
fake_image = generator(random_input, random_dim, is_train)
fake_image = putTargets(14,8,14,24,3,fake_image)

#real_result = discriminator(real_image, is_train)
#fake_result = discriminator(fake_image, is_train, reuse=True)
#fake_result = discriminator.predict(fake_image)  

fake_result =  evalInDiscriminator(4,8,14,24,3,fake_image)

#d_loss = tf.reduce_mean(fake_result) - tf.reduce_mean(real_result)  # This optimizes the discriminator.
g_loss = -tf.reduce_mean(fake_result)  # This optimizes the generator.
        

t_vars = tf.trainable_variables()
#d_vars = [var for var in t_vars if 'dis' in var.name]
g_vars = [var for var in t_vars if 'gen' in var.name]
#trainer_d = tf.train.RMSPropOptimizer(learning_rate=2e-4).minimize(d_loss, var_list=d_vars)
trainer_g = tf.train.RMSPropOptimizer(learning_rate=2e-4).minimize(g_loss, var_list=g_vars)
# clip discriminator weights
d_clip = [v.assign(tf.clip_by_value(v, -0.01, 0.01)) for v in d_vars]


batch_size = BATCH_SIZE
image_batch, samples_num = process_data()

batch_num = int(samples_num / batch_size)
total_batch = 0
sess = tf.Session()
saver = tf.train.Saver()
sess.run(tf.global_variables_initializer())
sess.run(tf.local_variables_initializer())
# continue training
save_path = saver.save(sess, "/tmp/model.ckpt")
ckpt = tf.train.latest_checkpoint('./model/' + version)
saver.restore(sess, save_path)
coord = tf.train.Coordinator()
threads = tf.train.start_queue_runners(sess=sess, coord=coord)

print('total training sample num:%d' % samples_num)
print('batch size: %d, batch num per epoch: %d, epoch num: %d' % (batch_size, batch_num, EPOCH))
print('start training...')
for i in range(EPOCH):
    print("Running epoch {}/{}...".format(i, EPOCH))
    for j in range(batch_num):
        print(j)
        #d_iters = 5
        g_iters = 1

        train_noise = np.random.uniform(-1.0, 1.0, size=[batch_size, random_dim]).astype(np.float32)
        '''
        for k in range(d_iters):
            print(k)
            train_image = sess.run(image_batch)
            #wgan clip weights
            sess.run(d_clip)
            
            # Update the discriminator
            _, dLoss = sess.run([trainer_d, d_loss],
                                feed_dict={random_input: train_noise, real_image: train_image, is_train: True})
        '''
        # Update the generator
        for k in range(g_iters):
            # train_noise = np.random.uniform(-1.0, 1.0, size=[batch_size, random_dim]).astype(np.float32)
            _, gLoss = sess.run([trainer_g, g_loss],
                                feed_dict={random_input: train_noise, is_train: True})

        # print 'train:[%d/%d],d_loss:%f,g_loss:%f' % (i, j, dLoss, gLoss)
'''        
    # save check point every 500 epoch
    if i%500 == 0:
        if not os.path.exists('./model/' + version):
            os.makedirs('./model/' + version)
        saver.save(sess, './model/' +version + '/' + str(i))  
    if i%50 == 0:
        # save images
        if not os.path.exists(newPoke_path):
            os.makedirs(newPoke_path)
        sample_noise = np.random.uniform(-1.0, 1.0, size=[batch_size, random_dim]).astype(np.float32)
        imgtest = sess.run(fake_image, feed_dict={random_input: sample_noise, is_train: False})
        # imgtest = imgtest * 255.0
        # imgtest.astype(np.uint8)
        save_images(imgtest, [8,8] ,newPoke_path + '/epoch' + str(i) + '.jpg')
        
        print('train:[%d],d_loss:%f,g_loss:%f' % (i, dLoss, gLoss))
'''        
        
coord.request_stop()
coord.join(threads)

