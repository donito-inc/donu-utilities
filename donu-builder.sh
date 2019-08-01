#!/bin/bash

###
# Donu builder script for Debian 10 "buster" and Ubuntu 19 "Disco Dingo"
###

echo "Installing Coin Dependencies"
sudo apt-get update
#sudo apt-get install -y build-essential libcurl4-openssl-dev libdb5.3-dev libdb5.3++-dev libtool autoconf autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev libprotobuf-dev protobuf-compiler libqt4-dev libcanberra-gtk-module
sudo apt-get install build-essential libtool autotools-dev automake pkg-config bsdmainutils python3 libssl-dev libevent-dev libboost-system-dev libboost-filesystem-dev libboost-chrono-dev libboost-test-dev libboost-thread-dev  libminiupnpc-dev libzmq3-dev libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler libqrencode-dev

echo "Installing Git"
sudo apt-get install -y git

echo "Cloning Source Code"
git clone https://github.com/donito-inc/donu-core donu-core

cd donu-core
echo "Building Source Code";
./autogen.sh;
./configure --with-incompatible-bdb
sudo make install -j $(nproc)

