#!/bin/bash

# Add scripts to crontab

# Make mp3 directory
mkdir /srv/mp3

# Copy scripts to /opt
REPO="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -a $REPO /opt
