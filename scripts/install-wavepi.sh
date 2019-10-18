#!/bin/bash
## run this as sudo to install wavepi service and link wavepi to the /usr/bin folder allowing you to control wavepi
## without having to specify the scripts folder. Not needed, but handy.

## load varibles...
CURRENT_DIR=$(dirname $(readlink -f $0))

## Installing dependancies
apt update
apt install build-essential fluidsynth alsa-utils python3 python3-pip git -yy
apt install librtmidi3 -yy
apt install librtmidi4 -yy
apt install python3-dev libasound2 libasound2-dev -yy
apt install python3-setuptools -yy
DEBIAN_FRONTEND='noninteractive' apt-get install -y jackd2 libjack-jackd2-dev
apt install libjack-jackd2-0 -yy

sudo pip3 install --upgrade pip
sudo pip3 install cython
sudo pip3 install rtmidi
sudo pip3 install python-rtmidi
sudo pip3 install mido
sudo pip3 install RPLCD
sudo pip3 install smbus

## Compile and install ttymidi
git clone https://github.com/ElBartoME/ttymidi/
cd ttymidi/
make
sudo make install
cd ..
rm -R ttymidi/

## Compile and install rtmidi
#wget https://github.com/SpotlightKid/python-rtmidi/archive/1.3.0.tar.gz
#tar xzf 1.3.0.tar.gz
#rm 1.3.0.tar.gz
#cd python-rtmidi-1.3.0
#python3 setup.py install
#cd ..
#rm -R python-rtmidi-1.3.0/
git clone https://github.com/SpotlightKid/python-rtmidi.git
cd python-rtmidi
git submodule update --init
python3 setup.py install
cd ..
rm -R python-rtmidi

## make symlinks...
ln -s $CURRENT_DIR/wavepi.sh /usr/bin/wavepi
ln -s $CURRENT_DIR/wavepi-service.sh /etc/init.d/wavepi
ln -s $CURRENT_DIR/wavepi-service.config /etc/init/wavepi.conf

## Downloading Soundfont
cd ../soundfonts
wget https://downloads.kor.ninja/Music/wavepi/PRO7USE.sf2
cd ../scripts

## register service to debian
update-rc.d wavepi defaults

sleep 3
service wavepi start

echo "scripts installed. just type wavepi and Have fun!!"
