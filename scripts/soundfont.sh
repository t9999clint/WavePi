#!/bin/bash
## soundfont.sh synth script example
## This script is meant to be run with the following syntax soundfont.sh <sf2 file> <alsa device number>

## set of reverb preferences to more closely match soundblaster awe
fluid_chorus_type=1
fluid_chorus_depth=8
fluid_chorus_speed=0.3
fluid_chorus_level=0.1
fluid_chorus_voices=3
fluid_reverb_level=0.1
fluid_reverb_width=0.75
fluid_reverb_damping=0.23
fluid_reverb_roomsize=0.61
fluid_interp=1

##find how many cpu threads are availible and act accordingly
CPU_LIMIT=$(nproc)
if (( CPU_LIMIT > 1)); then
    CPU_LIMIT=$((CPU_LIMIT - 1))
fi
POLY_LIMIT=$((CPU_LIMIT * 75))

## sanity check for poly limit (max of 999)
if (( POLY_LIMIT > 999)); then
    POLY_LIMIT=999
fi

## Check to make sure sf2 file exists, then run fluidsynth
if [ -f "$1" ]
then
    ## launch fluiddynth
    fluidsynth -o synth.cpu-cores=$CPU_LIMIT -o audio.alsa.device=hw:$2 -o audio.period-size=64 -o synth.polyphony=$POLY_LIMIT -R 0 -C 0 -is -r 44100 --gain 0.4 --audio-driver=alsa "$1"
else
    echo "ERROR, SOUNDFONT FILE $1 NOT FOUND!!"
fi
