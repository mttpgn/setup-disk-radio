#!/bin/bash

# Make mp3 directory
mkdir /srv/mp3
chmod 777 /srv/mp3 # We'll be regularly writing to this dir.

# Copy scripts to /opt
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -a $REPO /opt/
chmod +x /opt/setup-disk-radio/*sh

# Add scripts to crontab
echo "1 5 * * *   `logname`     python2 /opt/setup-disk-radio/musicscope.py" >> /etc/crontab
echo "1 17 * * *  `logname`     /opt/setup-disk-radio/clearoldsongs.sh" >> /etc/crontab
echo "@reboot     `logname`     /opt/setup-disk-radio/radio-player.sh" >> /etc/crontab

# First run to get some songs
python2 /opt/setup-disk-radio/musicscope.py
