#!/bin/bash
find ~/gPodder -type f -ctime -1 -name "*.mp3" | cut --delimiter=/ --fields=6,7 | nl

