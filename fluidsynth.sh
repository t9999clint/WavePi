#!/bin/bash
## fluidsynth.sh synth script example ##

## priority of the fluidsynth program. (-20 to 19, lower is better)
FLUID_PRIORITY = -18

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
    CPU_LIMIT = $((CPU_LIMIT - 1))
fi
POLY_LIMIT = $((CPU_LIMIT * 75))

## launch fluiddynth with set priority
nice -n $FLUID_PRIORITY /usr/local/bin/fluidsynth -o synth.cpu-cores=$CPU_LIMIT -o audio.alsa.device=hw:$2 -o audio.period-size=64 -o synth.polyphony=$POLY_LIMIT -R 0 -C 0 -is -r 44100 --gain 0.6 --audio-driver=alsa "$1"
