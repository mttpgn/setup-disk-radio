#!/bin/bash

if [ "$(id -u)" -ne 0 ] ; then
    echo "This script must be executed with root privileges."
    exit 1
fi

[ $SUDO_USER ] && U=$SUDO_USER || U=`who | awk '{print $1}' | head -1`
echo "Setting up crons for user $U"

# Make mp3 directory
mkdir -p /srv/mp3
chmod 777 /srv/mp3 # We'll be regularly writing to this dir.

# Copy scripts to /opt
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "Copying over executables to /opt/"
cp -a $REPO /opt/
chmod +x /opt/setup-disk-radio/*sh

# Add scripts to crontab
echo "1 5 * * *   $U     python2 /opt/setup-disk-radio/musicscope.py" >> /etc/crontab
echo "1 17 * * *  $U     /opt/setup-disk-radio/clearoldsongs.sh" >> /etc/crontab
echo "@reboot     $U     /opt/setup-disk-radio/radio-player.sh" >> /etc/crontab

# First run to get some songs
sudo -u $U python2 /opt/setup-disk-radio/musicscope.py
sudo -u $U /opt/setup-disk-radio/radio-player.sh
