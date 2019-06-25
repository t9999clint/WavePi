#!/bin/bash
## run this as sudo to install wavepi service and link wavepi to the /usr/bin folder allowing you to control wavepi
## without having to specify the scripts folder. Not needed, but handy.

## load varibles...
CURRENT_DIR=$(dirname $(readlink -f $0))

## make symlinks...
ln -s $CURRENT_DIR/wavepi.sh /usr/bin/wavepi
ln -s $CURRENT_DIR/wavepi-service.sh /etc/init.d/wavepi
ln -s $CURRENT_DIR/wavepi-service.config /etc/init/wavepi.conf

## register service to debian
update-rc.d wavepi defaults

echo "scripts installed. just type wavepi and Have fun!!"
