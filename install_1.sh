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
