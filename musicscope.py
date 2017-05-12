#!/bin/env python

from __future__ import unicode_literals
import youtube_dl
import praw

version = '1.3.0'
clientid = 'M4t6FAQerQ3hqA' # I got this from reddit.com once
clientsecret = None  # Registered as an "installed app" so not nesc
uagent = 'rpi:setup-disk-radio:v'+version+' by /u/mttpgn' # This is made up
qlDB = 'trends'
songspath = '/srv/mp3/'
options = {
    'format': 'bestaudio/best', # choice of quality
    'extractaudio' : True,      # only keep the audio
    'audioformat' : "mp3",      # convert to mp3
    'outtmpl': songspath + '%(id)s',        #name the file the ID of the video
    'noplaylist' : True,        # only download single song, not playlist
}

with open('subreddits.txt', 'r') as cfg:
    subs = cfg.read().splitlines()

dlim = 150

def dlSong(source, domain):
    with youtube_dl.YoutubeDL(options) as ydl:
        if domain == u'youtu.be':
            try:
                name = source.split("be/")[1]
                if os.path.isfile(name):
                    print "File already exists."
                else:
                    print "Downloading song from " + source
                    try:
                        ydl.download([source])
                        print "MP3 downloaded."
                    except:
                        print "Error, video not downloaded."
            except:
                print "Warning: not sure of the YouTube ID yet. Possible dupe. Trying anyway."
                try:
                    ydl.download([source])
                except:
                    print "Error, video failed to downloaded."
        elif domain == u'youtube.com':
            try:
                name = source.split("v=","&")[1]
                if os.path.isfile(name):
                    print "File already exists"
                else:
                    print "Downloading song from " + source
                    try:
                        ydl.download([source])
                    except:
                        print "Error, video not downloaded."
            except:
                print "Warning: not sure of the YouTube ID yet. Possible dupe. Trying again."
                try:
                    ydl.download([source])
                except:
                    print "Error, video failed to downloaded."
        else:
            print "Could not pull mp3 from domain " + domain

def main():
    reddit = praw.Reddit(client_id=clientid, \
                         client_secret=clientsecret, \
                         user_agent=uagent)
    ctr = 0
    subreddits = [reddit.subreddit(q) for q in subs]
    for sub in subreddits:
        print sub
        print "In Subreddit \""+sub.display_name+"\":"
        for submission in sub.hot(limit=dlim):
        # Top dlim # of posts in this subreddit sorted by what's "Hot".
            songObj = submission
            d = songObj.domain
            u = songObj.url
            # d is the external site the reddit user submission points too.
            if u'youtu' in d:
                # This includes youtu.be as well as youtube.com
                print "Adding song " + str(ctr) + " source: " + d
                ctr += 1
                dlSong(u, d)
    with open('log/dl.log', 'w') as logfile:
        logfile.write("Downloaded {1} new files on {2}.".format( \
                      str(ctr), 
                      str(datetime.now()) )

if __name__ == "__main__":
    main()

