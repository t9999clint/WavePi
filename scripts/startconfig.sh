#!/bin/bash
## This script will load a config file according to the number given (000 - 999). If no matching config file is found,
## it will just load the default config. It will save the result to ../logs/current-synth-info.log
## This script expects the following syntax... ./startconfig.sh <Config Number>

## DEFINE GLOBAL VARIBLES ##

CURRENT_DIR=$(dirname $(readlink -f $0))
CONFIG_REQUEST=$CURRENT_DIR"/../configs/"$1".cfg"

##Load varibles from main config
source "$CURRENT_DIR/../configs/main.cfg"
##Read current synth info
source "$CURRENT_DIR/../logs/current-synth-info.log"

## DEFINE FUNCTIONS ##

## Wait's for synth to finish loading and get's it's MIDI device number
WaitForSynth () {
    ## define varibles
    local LOOP_CYCLE=0
    local MAX_WAIT=2000
    local MIDI_NUMBER=-1
    
    ## use aconnect to wait for synth's name to show up in the list, then pull the number from it.
    while (( $LOOP_CYCLE<$MAX_WAIT ))
    do
        if (aconnect -o | grep $1 == true)
        then
            LOOP_CYCLE=$MAX_WAIT
            MIDI_NUMBER=$(aconnect -o | grep  -Eo '[0-9]{3}.*$1' | grep -Eo '[0-9]{3}')
        else
            LOOP_CYCLE=$(( LOOP_CYCLE+1 ))
            wait 0.1
        fi
    done
    return $MIDI_NUMBER
}

## Save's PID and other information to a file
SaveStatusToFile () {
## THIS WILL BE ADDED LATER ##
}

## Start Synth with given config
StartSynth () {
    ## Load varibles from given config
    source $1
    
    if (( $1==$RUNNING_CONFIG ))
    then
        echo "This synth is already running, doing nothing"
    else
        ## use ALSA to connect MIDI device to MIDI loop
        aconnect $MIDI_DEVICE:0 14:0 &
        
        ## run synth command, get PID for later use.
        echo "Launching " $SYNTH_NAME " Please wait..."
        $COMMAND $AUDIO_DEVICE & SYNTH_PID=$!
        
        ## wait for synth to load, get midi device number
        local SYNTH_MIDI=$(WaitForSynth $SYNTH_SEARCH)
    
        ## check if midi actually loaded or not
        if (( $SYNTH_MIDI == -1 ))
        then
            ## report error
            echo "ERROR: Failed to start synth!"
            SaveStatusToFile -1 "ERROR, FAILED TO START" -1
            
            ## kill any potentialy malfuntioning processes...
            pkill -P $SYNTH_PID &
            ## UGLY HACK, FIX LATER, FOR TESTING ONLY ##
            killall fluidsynth &
            killall mt32d &
            ## END OF UGLY HACK ##
            wait 2
        else
            ## join synth to MIDI loopback device, then save status
            aconnect 14:0 $SYNTH_MIDI:0 &
            SaveStatusToFile $SYNTH_PID $SYNTH_NAME $1
        fi        
    fi
    
}

## LET'S ACTUALLY START RUNNING STUFF ##

##Check if requested config exists, if not run defailt config instead.
if [ -f $CONFIG_REQUEST ]
then
    StartSynth $CONFIG_REQUEST
else
    echo "INVALID CONFIG REQUESTED"
    echo "$CONFIG_REQUEST NOT FOUND, LOADING DEFAULTS..."
    StartSynth $DEFAULT_CONFIG
fi
