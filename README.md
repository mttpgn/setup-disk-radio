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
Any time you turn the device off, it will pick resume playing a new song 
automatically as soon as it's powered back on.

If desired, the `subreddits.txt` file can be edited with subreddits to 
suit one's personal taste. Music subreddits to choose from can be found 
[in this list](https://www.reddit.com/r/Music/wiki/musicsubreddits).

Raspberry pi users can check [this guide](https://www.raspberrypi.org/documentation/configuration/wireless/wireless-cli.md) to make the device portable (i.e. ethernet free). 

Without WiFi, the radio will continue to loop through the songs in it's cache,
but just won't get fresh tracks until the day it's back online.
