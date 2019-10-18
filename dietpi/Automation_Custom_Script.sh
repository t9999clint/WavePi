#!/bin/bash

sudo apt-get update
sudo apt-get install wget -y
sudo apt-get install nano -y
sudo apt-get install tar -y

cd /home/dietpi
wget https://github.com/t9999clint/WavePi/archive/v0.8.0.tar.gz
tar -xzf v0.8.1.tar.gz
rm v0.8.1.tar.gz
mv WavePi-0.8.1 WavePi
cd WavePi

chmod +x ./install.sh
sudo rm /etc/proftpd/proftpd.conf
sudo cp /home/dietpi/WavePi/dietpi/proftpd.conf /etc/proftpd/proftpd.conf
service proftpd restart
sudo usermod -a -G audio dietpi
sudo usermod -a -G i2c dietpi
./install.sh
sudo chown -R dietpi /home/dietpi/WavePi
