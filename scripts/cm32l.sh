#!/bin/bash
##launch cm32l
CURRENT_DIR=$(dirname $(readlink -f $0))
LD_PRELOAD=/usr/local/lib/libmt32emu.so.2 mt32d -o 1 -i 24 -f "$CURRENT_DIR/../roms/"
