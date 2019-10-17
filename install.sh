#!/bin/bash
CCFLAGS="AUTO"

###### BIG SCARY WARNING FOR NON RASPBERRY PI USERS ######
### RUN AS ROOT, AND EDIT THE COMPLIATION OPTIMIZATIONS TO MATCH YOUR OWN PLATFORM BEFORE CONTINUING!!! ###
### If you are using a Raspberry Pi than this script should be able to automatically detect them.       ###

## Only enable the correct optimizations for your platform. You can enable then by removing the # before the export commands.
## These optimizations are from... https://retropie.org.uk/forum/topic/12549/tutorial-installing-munt-mt-32-emulation-on-rpi-3

  ## Raspberry Pi 4 
    #sudo export CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    
  ## Raspberry Pi 3
    #sudo export CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    
  ## Raspberry Pi 2
    #sudo export CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    
  ## Raspberry Pi 1/Zero (not sure whether Munt will be usable on these boards):
    #sudo export CCFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
    
  ## ODROID-C2:
    #sudo export CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -ftree-vectorize -funsafe-math-optimizations"
    
  ## ODROID-C1:
    #sudo export CCFLAGS="-Ofast -mcpu=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    
  ## ODROID-XU:
    #sudo export CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -DGL_GLEXT_PROTOTYPES"
    
  ## Freescale i.MX6 Quad/DualLite:
    #sudo export CCFLAGS="-Ofast -march=armv7-a -mfpu=neon -mtune=cortex-a9 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    
  ## x86/other/unknown:
    #sudo export CCFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
    
#check if ccflags have been manually set and auto detect hardware if it wasn't.
if [ CCFLAGS=="AUTO" ]
then
    
    ##Try and pull RasPi version from cpuinfo
    PI_ID=$(cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^1000//')
    PI_VERSION="none"
    
    #categorize PI_ID into categories
    if [ "$PI_ID" == "Beta" ] || [ "$PI_ID" == "0002" ] || [ "$PI_ID" == "0003" ] || [ "$PI_ID" == "0004" ] || [ "$PI_ID" == "0005" ] || [ "$PI_ID" == "0006" ] || [ "$PI_ID" == "0007" ] || [ "$PI_ID" == "0008" ] || [ "$PI_ID" == "0009" ] || [ "$PI_ID" == "000d" ] || [ "$PI_ID" == "000e" ] || [ "$PI_ID" == "000f" ] || [ "$PI_ID" == "0010" ] || [ "$PI_ID" == "0011" ] || [ "$PI_ID" == "0012" ] || [ "$PI_ID" == "0013" ] || [ "$PI_ID" == "0014" ] || [ "$PI_ID" == "0015" ] || [ "$PI_ID" == "900021" ] || [ "$PI_ID" == "900032" ] || [ "$PI_ID" == "900092" ] || [ "$PI_ID" == "900093" ] || [ "$PI_ID" == "9000c1" ] || [ "$PI_ID" == "a020a0" ] || [ "$PI_ID" == "a02100" ] || [ "$PI_ID" == "2Beta" ] || [ "$PI_ID" == "20002" ] || [ "$PI_ID" == "20003" ] || [ "$PI_ID" == "20004" ] || [ "$PI_ID" == "20005" ] || [ "$PI_ID" == "20006" ] || [ "$PI_ID" == "20007" ] || [ "$PI_ID" == "20008" ] || [ "$PI_ID" == "20009" ] || [ "$PI_ID" == "2000d" ] || [ "$PI_ID" == "2000e" ] || [ "$PI_ID" == "2000f" ] || [ "$PI_ID" == "20010" ] || [ "$PI_ID" == "20011" ] || [ "$PI_ID" == "20012" ] || [ "$PI_ID" == "20013" ] || [ "$PI_ID" == "20014" ] || [ "$PI_ID" == "20015" ] || [ "$PI_ID" == "2900021" ] || [ "$PI_ID" == "2900032" ] || [ "$PI_ID" == "2900092" ] || [ "$PI_ID" == "2900093" ] || [ "$PI_ID" == "29000c1" ] || [ "$PI_ID" == "2a020a0" ] || [ "$PI_ID" == "2a02100" ]
    then
        PI_VERSION="1"
    elif [ "$PI_ID" == "a01040" ] || [ "$PI_ID" == "a01041" ] || [ "$PI_ID" == "a01042" ] || [ "$PI_ID" == "a01041" ] || [ "$PI_ID" == "2a01040" ] || [ "$PI_ID" == "2a01041" ] || [ "$PI_ID" == "2a01042" ] || [ "$PI_ID" == "2a01041" ]
    then
        PI_VERSION="2"
    elif [ "$PI_ID" == "a02082" ] || [ "$PI_ID" == "a22082" ] || [ "$PI_ID" == "a32082" ] || [ "$PI_ID" == "a020d3" ] || [ "$PI_ID" == "9020e0" ] || [ "$PI_ID" == "2a02082" ] || [ "$PI_ID" == "2a22082" ] || [ "$PI_ID" == "2a32082" ] || [ "$PI_ID" == "2a020d3" ] || [ "$PI_ID" == "29020e0" ]
    then
        PI_VERSION="3"
    elif [ "$PI_ID" == "a03111" ] || [ "$PI_ID" == "b03111" ] || [ "$PI_ID" == "c03111" ] || [ "$PI_ID" == "2a03111" ] || [ "$PI_ID" == "2b03111" ] || [ "$PI_ID" == "2c03111" ]
    then
        PI_VERSION="4"
    fi
    
    #if Pi is detected, load appropriate optimizations.
    if [ "$PI_VERSION" == "1" ]
    then
        echo "Raspberry PI 1/zero Detected!"
        sudo export CCFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
    elif [ "$PI_VERSION" == "2" ]
    then
        echo "Raspberry PI 2 Detected!"
        sudo export CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -mvectorize-with-neon-quad -ftree-vectorize -funsafe-math-optimizations"
    elif [ "$PI_VERSION" == "3" ]
    then
        echo "Raspberry PI 3 Detected!"
        sudo export CCFLAGS="-Ofast -mcpu=cortex-a53 -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -mvectorize-with-neon-quad -ftree-vectorize -funsafe-math-optimizations"
    elif [ "$PI_VERSION" == "4" ]
    then
        echo "Raspberry PI 4 Detected!"
        sudo export CCFLAGS="-Ofast -mcpu=cortex-a72 -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -mvectorize-with-neon-quad -ftree-vectorize -funsafe-math-optimizations"
    
    ##If archetecture cannot be detected, and no manual setting was chosen, then it will alert the user and use safe optimizations.
    else
        echo "!!Unable to detect hardware, using safe defaults!!"
        read -p "PRESS ENTER KEY IF OK, CTRL-C to quit"
        sudo export CCFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
    fi

##Alert user that manual settings were chosen, and display what they are.
else
echo "Optimizations chosen... $CCFLAGS"
read -p "Manual config detected, PRESS ENTER KEY IF READY, CTRL-C to quit!"
fi

##Make CCX match CC
sudo export CXXFLAGS="$CCFLAGS"

## Setup development enviroment
  sudo apt update
  sudo apt install build-essential cmake libasound-dev libx11-dev libxpm-dev libxt-dev -yy
  sudo usermod -a -G audio $USER
  sudo usermod -a -G i2c $USER
  
## load varibles...
  CURRENT_DIR=$(dirname $(readlink -f $0))
  CPUCores=$(nproc)
  

## Download mt32emu, replace download link with latest version (optional)...
  cd /usr/src
  sudo wget https://github.com/munt/munt/archive/munt_2_3_0.tar.gz
  sudo tar xzf munt_2_3_0.tar.gz
  cd munt-munt_2_3_0

## Compile and install mt32emu
  cd mt32emu
  sudo cmake -DCMAKE_BUILD_TYPE:STRING=Release .
  sudo make -j $CPUCores
  sudo make install
  cd ..

## Compile and install mt32emu alsa driver
  cd mt32emu_alsadrv
  sudo make -j $CPUCores
  sudo make install
  cd ..
  
##Clean up munt compile
  cd ..
  sudo rm -R ./munt-munt_2_3_0
  sudo rm munt_2_3_0.tar.gz
  cd $CURRENT_DIR
  
## Install WavePi service
  sudo chmod +x ./scripts/*
  cd scripts
  sudo bash ./install-wavepi.sh
  cd ..
