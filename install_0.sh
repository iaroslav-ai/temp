
sudo apt-get update

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

sudo reboot

