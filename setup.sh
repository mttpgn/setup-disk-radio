#!/bin/bash

# Add scripts to crontab

# Make mp3 directory
mkdir /srv/mp3
chmod 777 /srv/mp3 # We'll be regularly writing to this dir.

# Copy scripts to /opt
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -a $REPO /opt/
chmod +x /opt/setup-disk-radio/*sh

# First run to get some songs
python2 /opt/setup-disk-radio/musicscope.py
