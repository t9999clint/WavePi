#!/bin/bash
## This script is meant to be installed as a service script for systemd (or init.d) to use.
## it currently can't pull proper the status from anything but w/e

### BEGIN INIT INFO
# Provides:          wavepi
# Required-Start:    $syslog
# Required-Stop:     
# Should-Start:      
# Default-Start:     2 3 4 5
# Default-Stop:      
# Short-Description: WavePI - MIDI Synth frontend script
# Description:       WavePi runs as a frontend for several MIDI services
#                    like Fluidsynth and Munt.
#                    This service helps provide sysex profile switching.
### END INIT INFO

## DEFINE VARIBLES ##

CURRENT_DIR=$(dirname $(readlink -f $0))
## Read varibles from main.cfg
source $CURRENT_DIR/../configs/main.cfg
## set process priority level (nice number), the range is -20 - 18, lower the number, the higher the priority.
NICE_LEVEL=-18
## s

## DEFINE FUNCTIONS ##

status ()
{
    ## load varibles from all log files...
    source $CURRENT_DIR/../logs/current-synth-info.log
    ## other log files go here...

    ## do some simple logic
    WAVE_PI_RUNNING="OFF"
    if [ "$RUNNING_PID" != "-1" ]
    then
        WAVE_PI_RUNNING="RUNNING"
    fi

    ## start printing out statuses...
    echo "WavePi Synth status is currently - $RUNNING_SYNTH_NAME"
    echo "WavePi Synth is currently $WAVE_PI_RUNNING"
    if [ "$WAVE_PI_RUNNING" == "RUNNING" ]
    then
        echo "WavePi Synth PID number is $RUNNING_PID"
    fi
    ## other script status stuff to go in here...
}

start ()
{
    nice -n $NICE_LEVEL sudo -u $WAVEPI_USER $CURRENT_DIR/wavepi.sh $DEFAULT_CONFIG

    ## Start python script to listen for config requests over sysex...
    nice -n $NICE_LEVEL sudo -u $WAVEPI_USER python3 $CURRENT_DIR/midi-listen.py 0 &

    ## Check if RGB is enabled and run RGB script if it is...
    if [ "$RGB" == "true" ] || [ "$RGB" == "TRUE" ] || [ "$RGB" == "YES" ] || [ "$RGB" == "yes" ] || [ "$RGB" == "1" ]
    then
        sudo -u $WAVEPI_USER $CURRENT_DIR/midirgb.sh &
    fi
    
    ## Check if Serial is enabled and run the Serial Midi script as root if it is...
    if [ "$SERIAL_ENABLE" == "true" ] || [ "$SERIAL_ENABLE" == "TRUE" ] || [ "$SERIAL_ENABLE" == "YES" ] || [ "$SERIAL_ENABLE" == "yes" ] || [ "$SERIAL_ENABLE" == "1" ]
    then
        $CURRENT_DIR/serial-midi.sh $SERIAL_DEVICE &
        ##UGLY HACK until I implement a better way of doing this
        #aconnect 128:0 14:0
        #aconnect 129:0 14:0
	sleep 1
	aconnect 'ttymidi':0 'Midi Through':0
        ##END OF UGLY HACK
    fi
}

stop ()
{
    sudo -u $WAVEPI_USER $CURRENT_DIR/wavepi.sh stop
    
    ##UGLY HACK for TTYMIDI support
    killall ttymidi
    ##END OF UGLY HACK
    
    ## other stop scripts for other stuff...
}

## DEFINE MAIN PROGRAM

## simple elseif tree for $1 command
if [ "$1" == "start" ] || [ "$1" == "START" ]
then
    start
    sleep 2
    status

## If $1 is STOP, stop synth and print status when done...
elif [ "$1" == "stop" ] || [ "$1" == "STOP" ]
then
    stop
    sleep 2
    status

## If $1 is RESTART, stop then start synth and print status when done...
elif [ "$1" == "restart" ] || [ "$1" == "RESTART" ]
then
    echo "stopping......."
    stop
    sleep 2
    echo "starting......."
    start
    sleep 2
    status

## If $1 is STATUS, print status...
elif [ "$1" == "status" ] || [ "$1" == "STATUS" ]
then
    echo "printing status...."
    status

## print error if command not recognized
else
    echo "INVALID REQUEST! DOING NOTHING"
fi
