###### BIG SCARY WARNING ######
### RUN AS ROOT, AND EDIT THE COMPLIATION OPTIMIZATIONS TO MATCH YOUR OWN PLATFORM BEFORE CONTINUING!!! ###

## Only enable the correct optimizations for your platform. You can enable then by removing the # before the export commands.
## These optimizations are from... https://retropie.org.uk/forum/topic/12549/tutorial-installing-munt-mt-32-emulation-on-rpi-3

  ## Raspberry Pi 3
    #export CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## Raspberry Pi 2
    #export CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## Raspberry Pi 1/Zero (not sure whether Munt will be usable on these boards):
    #export CCFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"
    #export CXXFLAGS="-Ofast -mfpu=vfp -march=armv6j -mfloat-abi=hard"

  ## ODROID-C2:
    #export CCFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -march=armv8-a+crc -mtune=cortex-a53 -mfpu=neon-fp-armv8 -ftree-vectorize -funsafe-math-optimizations"

  ## ODROID-C1:
    #export CCFLAGS="-Ofast -mcpu=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -mcpu=cortex-a5 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## ODROID-XU:
    #export CCFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -DGL_GLEXT_PROTOTYPES"
    #export CXXFLAGS="-Ofast -mcpu=cortex-a7 -mfpu=neon-vfpv4 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations -DGL_GLEXT_PROTOTYPES"

  ## Freescale i.MX6 Quad/DualLite:
    #export CCFLAGS="-Ofast -march=armv7-a -mfpu=neon -mtune=cortex-a9 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -march=armv7-a -mfpu=neon -mtune=cortex-a9 -mfloat-abi=hard -ftree-vectorize -funsafe-math-optimizations"

  ## x86/other/unknown:
    #export CCFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"
    #export CXXFLAGS="-Ofast -march=native -ftree-vectorize -funsafe-math-optimizations"

echo "MAKE SURE CPU OPTIMIZATIONS ARE SET BEFORE RUNNING THIS!!!"
pause

## Setup development enviroment
  apt update
  apt install build-essential cmake libasound-dev libx11-dev libxpm-dev libxt-dev -yy

## Download mt32emu, replace download link with latest version (optional)...
  cd /usr/src
  wget https://github.com/munt/munt/archive/munt_2_3_0.tar.gz
  tar xzf munt_2_3_0.tar.gz
  cd munt-munt_2_3_0

## Compile and install mt32emu
  cd mt32emu
  cmake -DCMAKE_BUILD_TYPE:STRING=Release .
  make -j 4
  make install
  cd ..

## Compile and install mt32emu alsa driver
  cd mt32emu_alsadrv
  make -j 4
  make install
  cd ..
