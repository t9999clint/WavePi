#!/bin/bash

sudo apt-get update
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install tar -y

wget wavepiurl
cd \home\dietpi
tar -xzf WavePi-WavePi.tar.gz
mv WavePi-WavePi WavePi
cd WavePi
chmod +x ./install.sh
./install.sh
cd ..
cd dietpi
sudo rm /etc/proftpd/proftpd.conf
sudo cp proftpd.conf /etc/proftpd/proftpd.conf
