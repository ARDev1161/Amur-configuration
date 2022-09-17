#!/bin/sh

echo "PiGPIO installing..."
wget https://github.com/joan2937/pigpio/archive/master.zip
unzip master.zip
cd pigpio-master
make
sudo make install
cd ..

sudo apt-get install cmake -y
./grpc-install
sudo apt-get install libconfig++-dev -y

dir=$(pwd)

cd $HOME
git clone https://github.com/ARDev1161/AmurClient.git --recurse-submodules
cd AmurClient
mkdir bin && cd bin
cmake -DCMAKE_BUILD_TYPE=Release ../
cmake --build . -- -j4

cd $dir
