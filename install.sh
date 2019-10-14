##/bin/bash
CCFLAGS="AUTO"

###### BIG SCARY WARNING ######
### RUN AS ROOT, AND EDIT THE COMPLIATION OPTIMIZATIONS TO MATCH YOUR OWN PLATFORM BEFORE CONTINUING!!! ###

## Only enable the correct optimizations for your platform. You can enable then by removing the # before the export commands.
## These optimizations are from... https://retropie.org.uk/forum/topic/12549/tutorial-installing-munt-mt-32-emulation-on-rpi-3

  ## Raspberry Pi 4 
    #CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## Raspberry Pi 3
    #CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## Raspberry Pi 2
    #CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## Raspberry Pi 1/Zero (not sure whether Munt will be usable on these boards):
    #CCFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
    #CXXFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"

  ## ODROID-C2:
    #CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -ftree-vectorize -funsafe-math-optimizations"

  ## ODROID-C1:
    #CCFLAGS="-Ofast -mcpu=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -mcpu=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## ODROID-XU:
    #CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -DGL_GLEXT_PROTOTYPES"
    #CXXFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -DGL_GLEXT_PROTOTYPES"

  ## Freescale i.MX6 Quad/DualLite:
    #CCFLAGS="-Ofast -march=armv7-a -mfpu=neon -mtune=cortex-a9 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -march=armv7-a -mfpu=neon -mtune=cortex-a9 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## x86/other/unknown:
    #CCFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
    #CXXFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"

#check if ccflags have been manually set and auto detect hardware if it wasn't.
if [ CCFLAGS=="AUTO" ]
then
    
    ##Try and pull RasPi version from cpuinfo
    PI_ID=(cat /proc/cpuinfo | grep 'Revision' | awk '{print $3}' | sed 's/^1000//')
    PI_VERSION="none"
    
    #categorize PI_ID into categories
    if [ PI_ID == "Beta" ] || [ PI_ID == "0002" ] || [ PI_ID == "0003" ] || [ PI_ID == "0004" ] || [ PI_ID == "0005" ] || [ PI_ID == "0006" ] || [ PI_ID == "0007" ] || [ PI_ID == "0008" ] || [ PI_ID == "0009" ] || [ PI_ID == "000d" ] || [ PI_ID == "000e" ] || [ PI_ID == "000f" ] || [ PI_ID == "0010" ] || [ PI_ID == "0011" ] || [ PI_ID == "0012" ] || [ PI_ID == "0013" ] || [ PI_ID == "0014" ] || [ PI_ID == "0015" ] || [ PI_ID == "900021" ] || [ PI_ID == "900032" ] || [ PI_ID == "900092" ] || [ PI_ID == "900093" ] || [ PI_ID == "9000c1" ] || [ PI_ID == "a020a0" ] || [ PI_ID == "a02100" ]
    then
        PI_VERSION="1"
    elif [ PI_ID == "a01040" ] || [ PI_ID == "a01041" ] || [ PI_ID == "a01042" ] || [ PI_ID == "a01041" ]
    then
        PI_VERSION="2"
    elif [ PI_ID == "a02082" ] || [ PI_ID == "a22082" ] || [ PI_ID == "a32082" ] || [ PI_ID == "a020d3" ] || [ PI_ID == "9020e0" ]
    then
        PI_VERSION="3"
    elif [ PI_ID == "a03111" ] || [ PI_ID == "b03111" ] || [ PI_ID == "c03111" ]
    then
        PI_VERSION='4'
    fi
    
    #if Pi is detected, load appropriate optimizations.
    if [ PI_VERSION=="1" ]
    then
        echo "Raspberry PI 1/zero Detected!"
        CCFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
        CXXFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
    elif [ PI_VERSION=="2" ]
    then
        echo "Raspberry PI 2 Detected!"
        CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
        CXXFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    elif [ PI_VERSION=="3" ]
    then
        echo "Raspberry PI 3 Detected!"
        CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
        CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    elif [ PI_VERSION=="4" ]
    then
        echo "Raspberry PI 4 Detected!"
        CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
        CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a72 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    else
        echo "!!Unable to detect hardware, using safe defaults!!"
        CCFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
        CXXFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
    fi

fi

read -p "THIS SCRIPT MUST BE RUN AS ROOT, PRESS ENTER KEY IF READY!"

## Setup development enviroment
  apt update
  apt install build-essential cmake libasound-dev libx11-dev libxpm-dev libxt-dev -yy
  
## Getting max cores from system
  CPUCores=$(nproc)

## Download mt32emu, replace download link with latest version (optional)...
  cd /usr/src
  wget https://github.com/munt/munt/archive/munt_2_3_0.tar.gz
  tar xzf munt_2_3_0.tar.gz
  cd munt-munt_2_3_0

## Compile and install mt32emu
  cd mt32emu
  cmake -DCMAKE_BUILD_TYPE:STRING=Release .
  make -j $CPUCores
  make install
  cd ..

## Compile and install mt32emu alsa driver
  cd mt32emu_alsadrv
  make -j $CPUCores
  make install
  cd ..
  
## Install WavePi service
  cd scripts
  source ./install-wavepi.sh
