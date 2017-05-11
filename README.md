# setup-disk-radio

setup-disk-radio is program to turn a raspberry pi or any underused Linux/Unix 
deivce into a standalone radio. 

Specifically, this program scrapes music-themed subreddits for new, trending 
songs, and downloads those songs to be served in continuous, ad-free playback, 
much like a radio. 

To start, ensure the following dependencies are installed on the device you
wish to transform into a radio:
```
apt-get install mplayer sudo
pip install youtube_dl praw
```

Next, run the setup script as root user. 

```
./setup.sh
```

You can now plug a speaker set into the raspberry pi's audio jack, and enjoy 
an uninterrupted stream of the hottest new music, pulled daily from reddit. 
Any time you unplug the device and plug it back, it will pick a new song and 
resume playing automatically. 

If desired, the `subreddits.txt` file can be edited with some subreddits to 
suit one's personal taste. Good music subreddits can be found [in this list](https://www.reddit.com/r/Music/wiki/musicsubreddits).

Raspberry pi users can check [this guide](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md) to make the device portable. 

Without WiFi, the radio will continue to loop through the songs in it's cache,
but just won't be able to get fresh tracks until the day it's back online.
