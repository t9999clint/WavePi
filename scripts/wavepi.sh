#!/bin/bash
## This script will load a config file according to the number given (000 - 999). If no matching config file is found,
## it will just load the default config. It will save the result to ../logs/current-synth-info.log
## This script expects the following syntax... ./startconfig.sh <Config Number>

## DEFINE GLOBAL VARIBLES ##

CURRENT_DIR=$(dirname $(readlink -f $0))
CONFIG_REQUEST="$CURRENT_DIR/../configs/$1.cfg"

##Load varibles from main config
source "$CURRENT_DIR/../configs/main.cfg"
##Read current synth info
source "$CURRENT_DIR/../logs/current-synth-info.log"

## DEFINE FUNCTIONS ##

## Saves PID and other information to a file
SaveStatusToFile () {
    SYNTH_LOG="$CURRENT_DIR/../logs/current-synth-info.log"
    echo -e "RUNNING_PID=$1\nRUNNING_SYNTH_NAME=\"$2\"\nRUNNING_CONFIG=\"$3\"" > $SYNTH_LOG
    ##echo "saved status debug message, $1, $2, $3"
}

## Waits for synth to finish loading and gets its MIDI device number
WaitForSynth () {
    ## define varibles
    ##echo "debug message, looking for $SYNTH_SEARCH, good luck!"

    local LOOP_CYCLE=0
    local MAX_WAIT=1500
    MIDI_NUMBER=0
    
    ## use aconnect to wait for synth's name to show up in the list, then pull the number from it.
    while (( $LOOP_CYCLE<$MAX_WAIT ))
    do
        if aconnect -o | grep $SYNTH_SEARCH
        then
            LOOP_CYCLE=$MAX_WAIT
            MIDI_NUMBER=$(aconnect -o | grep  -Eo '[0-9]{3}.*$SYNTH_SEARCH' | grep -Eo '[0-9]{3}')
	    SUCCESS=1
        else
            LOOP_CYCLE=$(( $LOOP_CYCLE+1 ))
            sleep 0.1
        fi
    done
}

## Stops the current synth running
StopSynth () {
    if [ "$RUNNING_PID" != "-1" ]
    then
        pkill -P $RUNNING_PID
    fi
    ## UGLY HACK for testing (don't think it's needed anymore) ###
    #killall mt32d
    #killall fluidsynth
    ## END OF UGLY HACK ##
    SaveStatusToFile -1 "...LOADING PLEASE WAIT..." -1
    sleep 2
}

## Start Synth with given config
StartSynth () {
    ## Load varibles from given config
    FILE_NAME=$(basename "$1")
    FILE_EXT="${FILE_NAME##*.}"
    if [ "$FILE_EXT" == "cfg" ] || [ "$FILE_EXT" == "CFG" ]
    then
        source $1
    elif [ "$FILE_EXT" == "sf2" ] || [ "$FILE_EXT" == "SF2" ]
    then
        SYNTH_NAME="${FILE_NAME%.*}"
        COMMAND="soundfont.sh $1"
        SYNTH_SEARCH="FLUID"
    else
        echo "ERROR: FILE EXTENSION $FILE_EXT NOT SUPPORTED!"
        ##StartSynth "$CURRENT_DIR/../configs/$DEFAULT_CONFIG.cfg"
        RUNNING_CONFIG="$1"
    fi
    
    if [ "$1" = "$RUNNING_CONFIG" ]
    then
        echo "This synth is already running, doing nothing"
   
    else
        ## stopping current running config
        StopSynth

        ## use ALSA to connect MIDI device to MIDI loop
        aconnect $MIDI_DEVICE:0 14:0 &
        
        ## run synth command, get PID for later use.
        echo "Launching $SYNTH_NAME Please wait..."
        bash $CURRENT_DIR/$COMMAND $AUDIO_DEVICE & SYNTH_PID=$!
        
        ## wait for synth to load, get midi device number
	WaitForSynth "$SYNTH_SEARCH"
        
        ## check if midi actually loaded or not
	echo "DEBUG MESSAGE - MIDI NUMBER>$MIDI_NUMBER<"
	
	if [ "$MIDI_NUMBER" == "0" ]
        then
            ## report error
            echo "ERROR: Failed to start synth!"
            SaveStatusToFile -1 "ERROR, FAILED TO START" -1
            
            ## kill any potentialy malfuntioning processes...
            pkill -P $SYNTH_PID
            ## UGLY HACK, FIX LATER, FOR TESTING ONLY (probably smart to keep for now)##
            killall fluidsynth &
            killall mt32d &
            ## END OF UGLY HACK ##
            sleep 2
        else
            ## join synth to MIDI loopback device, then save status
            ## echo "success??"
	    aconnect 14:0 $MIDI_NUMBER:0
	    ## UGLY HACK, UNTIL I FIX MIDI_NUMBER ISSUE##
            aconnect 14:0 128:0 &
	    aconnect 14:0 129:0 &
	    aconnect 14:0 130:0 &
            ## END OF UGLY HACK##
            SaveStatusToFile "$SYNTH_PID" "$SYNTH_NAME" "$1"
        fi
    fi
}

## LETS ACTUALLY START RUNNING STUFF ##

## If stop is requested, then just stop the running config
if [ "$1" == "stop" ] || [ "$1" == "STOP" ]
then
    StopSynth
    SaveStatusToFile -1 "Synth has been stopped." -1

## Check if requested config number exists
elif [ -f "$CONFIG_REQUEST" ]
then
    StartSynth "$CONFIG_REQUEST"
    
## if direct path to file is given, and above is not valid, run the file
elif [ -f "$1" ]
then
    StartSynth "$1"

## if above is not valid then run defailt config instead.
else
    echo "INVALID CONFIG REQUESTED"
    echo "$CONFIG_REQUEST NOT FOUND, LOADING DEFAULTS..."
    StartSynth $CURRENT_DIR/../configs/$DEFAULT_CONFIG.cfg
fi
