#!/bin/bash

# --- !mote --- #
# this script is like the podcast copy script,
# but, this is for english audio, and the script find files was **created** befor one day.
# for doc please see the comments in "copy podcast" script.
# --- end --- #

en_for_day="$(date +'%d-%m-%y')"

mkdir /run/media/nachmen/9C33-6BBD/english/"$en_for_day"/

find ~/Downloads/VideoDownloader/.English -type f -ctime -1 -name "*.mp3" -exec cp -t /run/media/nachmen/9C33-6BBD/english/"$en_for_day"/ {} +
