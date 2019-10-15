#!/bin/bash

sudo apt-get update
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install tar -y

cd \home\dietpi
wget https://github.com/t9999clint/WavePi/archive/v0.8.0.tar.gz
tar -xzf v0.8.0.tar.gz
mv WavePi-0.8.0 WavePi
cd WavePi
chmod +x ./install.sh
./install.sh
cd ..
cd dietpi
sudo rm /etc/proftpd/proftpd.conf
sudo cp proftpd.conf /etc/proftpd/proftpd.conf
