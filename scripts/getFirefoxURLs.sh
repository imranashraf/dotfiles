#!/usr/bin/python

import json
from os.path import expanduser
import glob

homedir = expanduser("~")
profpath = homedir + "/.mozilla/firefox/"
#prof = profpath + "6kx0s8oq.default/sessionstore-backups/recovery.js"

# following is an automatic way of determining the profile directory
# and then locating the required file.
for prof in glob.glob(profpath+'/*.default'):
        print "Profile director is " +  prof

prof +="/sessionstore-backups/recovery.js"

#print profpath
#print prof

fin = open(prof, "r")
jdata = json.loads( fin.read() )
fin.close()

#TODO add it later
# nWin = win.get("tabs")
# print "Number of open windows in firefox = " + nWin

nTabs = str(jdata["windows"][0]["selected"])
print "Number of open tabs in firefox (in first window) = " + nTabs

for win in jdata.get("windows"):
    for tab in win.get("tabs"):
        i = tab.get("index") - 1
        print tab.get("entries")[i].get("url")

