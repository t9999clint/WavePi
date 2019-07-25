#!/bin/bash
## This script lauches a program to listen to the specified TTY device for midi messages and redirects that to a
## virtual ALSA midi device. (usually 128:0)

ttymidi -s $1 -b 38400
