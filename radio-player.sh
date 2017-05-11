#!/bin/bash

DIR='/srv/mp3'
LOGDIR='/opt/setup-disk-radio/log'

amixer cset numid=3 1
# Pipe audio through headphone jack, even if HDMI is connected.

while true; do
    NEXTUP=`ls $DIR | shuf -n1`
    echo "Now Playing : https://youtu.be/$NEXTUP : `date`" > $LOGDIR/np.log
    mplayer $DIR/$NEXTUP
done
