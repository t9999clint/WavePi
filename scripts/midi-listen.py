#!/usr/bin/env python
#
# midi-listen.py
# This is a really rough draft of a script to listen for certain sysex commands for config requests
# then use the number specified to switch to that config. This script is just a hacked together version
# of the python example for rtmidi. I'll clean this up later...
#
"""Show how to receive MIDI input by polling an input port."""

from __future__ import print_function

import logging
import sys
import time
import os

from rtmidi.midiutil import open_midiinput


log = logging.getLogger('midiin_poll')
logging.basicConfig(level=logging.DEBUG)

# Prompts user for MIDI input port, unless a valid port number or name
# is given as the first argument on the command line.
# API backend defaults to ALSA on Linux.
port = sys.argv[1] if len(sys.argv) > 1 else None

try:
    midiin, port_name = open_midiinput(port)
except (EOFError, KeyboardInterrupt):
    sys.exit()

## set script to listen to sysex
midiin.ignore_types(sysex=False)

print("Entering main loop. Press Control-C to exit.")
try:
    timer = time.time()
    while True:
        msg = midiin.get_message()

        if msg:
            message, deltatime = msg
            timer += deltatime
            if message[0] == 240 and message[1] == 102 and message[2] == 4 and message[4] == 247:
                print("request detected, change to config number", str(message[3]))
                os.system('wavepi 00' + str(message[3]))

        time.sleep(0.01)
except KeyboardInterrupt:
    print('')
finally:
    print("Exit.")
    midiin.close_port()
del midiin
