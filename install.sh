#!/bin/bash

﻿sudo apt-get update
sudo apt-get install git -y

wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1404_7.5-18_amd64.deb
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y opencl-headers build-essential protobuf-compiler \
    libprotoc-dev libboost-all-dev libleveldb-dev hdf5-tools libhdf5-serial-dev \
    libopencv-core-dev  libopencv-highgui-dev libsnappy-dev libsnappy1 \
    libatlas-base-dev cmake libstdc++6-4.8-dbg libgoogle-glog0 libgoogle-glog-dev \
    libgflags-dev liblmdb-dev git python-pip gfortran

sudo apt-get clean
sudo apt-get install -y linux-image-extra-`uname -r` linux-headers-`uname -r` linux-image-`uname -r`

sudo apt-get install -y cuda
sudo apt-get clean

echo 'export PATH="/usr/local/cuda/bin:"$PATH' >> .bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda/lib:/usr/local/lib:"$LD_LIBRARY_PATH' >> .bashrc

# install python essentials
sudo apt-get install python-pip -y
sudo apt-get install python-dev python-nose g++ libopenblas-dev git -y
sudo pip install -U numpy
sudo pip install --upgrade git+git://github.com/cython/cython@master
sudo apt-get install python-scipy -y
sudo pip install scikit-image
sudo apt-get install python-opencv -y
sudo pip install webcolors
sudo apt-get install python-sklearn -y

# htop
sudo apt-get install htop -y

cd temp

# install OpenCV
sudo bash ocv.sh

# install CuDNN
tar -xzvf cd_inst.tgz
cd cuda
cd lib64
sudo cp * /usr/local/cuda/lib64/
cd ..
cd include
sudo cp cudnn.h /usr/local/cuda/include/
cd ..
cd ..
rm -rf cuda

# install Theano
sudo pip install Theano

# install TensorFlow
sudo apt-get install python-pip python-dev -y
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0rc0-cp27-none-linux_x86_64.whl
sudo pip install --upgrade $TF_BINARY_URL

# install Keras
sudo pip install keras

# install Neon
cd
sudo apt-get install python-pip -y
sudo apt-get install libhdf5-dev -y
sudo apt-get install libyaml-dev -y
git clone https://github.com/NervanaSystems/neon.git
cd neon && sudo make sysinstall

# install MxNet
cd
sudo apt-get update
sudo apt-get install -y build-essential git libatlas-base-dev libopencv-dev
git clone --recursive https://github.com/dmlc/mxnet
cd mxnet
echo -e "USE_CUDA = 1\nUSE_CUDA_PATH = /usr/local/cuda\nUSE_BLAS = blas" > make/config.mk
make -j$(nproc)
sudo apt-get install python-setuptools -y
cd python; sudo python setup.py install
