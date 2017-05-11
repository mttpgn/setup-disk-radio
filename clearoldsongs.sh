#!/bin/bash

ADEQUATESPACE=90
PERCENTFREE=`df -k /srv/mp3 | awk '{if ($1 != "Filesystem") print $5 " "}'`
SPACEFREE=`echo $PERCENTFREE | tr -d '%'`
echo $PERCENTFREE $SPACEFREE space currently used on disk.

CTR=0
while  [[ "$SPACEFREE" -gt "$ADEQUATESPACE" ]]; do
    F=`find /srv/mp3 -type f -printf '%T+ %p\n' | sort | head -n 1 | cut -d \  -f 2`
    rm -fv $F
    SPACEFREE=`df -k /srv/mp3 | egrep "([90][0-9]|100)%"`
    CTR=$((CTR+1))
done

echo "Deleted $CTR songs from /srv/mp3/ on `date`" > /opt/setup-disk-radio/log/rm.log
exit 0
