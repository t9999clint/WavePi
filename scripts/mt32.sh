#!/bin/bash
##launch mt32
CURRENT_DIR=$(dirname $(readlink -f $0))
LD_PRELOAD=/usr/local/lib/libmt32emu.so.2 mt32d -o 2 -i 24 -f "$CURRENT_DIR/../roms/"
