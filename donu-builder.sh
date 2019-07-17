#!/bin/bash

###
# Donu builder script for Debian 10 "buster" and Ubuntu 19 "Disco Dingo"
###

echo "Installing Coin Dependencies"
sudo apt-get update
sudo apt-get install -y build-essential libcurl4-openssl-dev libdb5.3-dev libdb5.3++-dev libtool autoconf autotools-dev automake pkg-config libssl-dev libevent-dev bsdmainutils python3 libboost-all-dev libprotobuf-dev protobuf-compiler libqt4-dev libcanberra-gtk-module

echo "Installing Git"
sudo apt-get install -y git

echo "Cloning Source Code"
git clone https://github.com/donito-inc/donu-core donu-core

cd donu-core
echo "Building Source Code";
./autogen.sh;
./configure --with-incompatible-bdb
sudo make install -j $(nproc)

