# setup-disk-radio

setup-disk-radio is program to turn a raspberry pi or any underused Linux/Unix 
deivce into a radio. 

Specifically, this program scrapes music-themed subreddits for new, trending 
songs, and downloads those songs to be served later in continuous, ad-free
music playback, much like a radio. 

To start, ensure the following dependencies are installed:
```
sudo apt-get install mplayer
sudo pip install youtube_dl praw
```

Run the setup script, which will make some directories and set up some crons. 

The radio will pull new music from reddit once per day. 
Edit the subreddits.txt file with some subreddits you prefer. Some good music 
subreddits can be found [in this list](https://www.reddit.com/r/Music/wiki/musicsubreddits).

If you're choosing your own, I only selected subreddits that:
 * share a musical theme
 * have an active user community
 * post music videos rather than instructional or technical videos

Right now, the radio only pulls songs that were posted from YouTube.
