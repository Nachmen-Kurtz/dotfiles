#!/bin/bash

source $HOME/.system/shell_config/env_var.zsh

# mkdir /run/media/nachmen/9C33-6BBD/gPodder/$DATE
mkdir -p ~/.tmp/gPodder/"$DATE"

# cp $(find ~/gPodder -type f -ctime -1 -name "*.mp3") /run/media/nachmen/9C33-6BBD/gPodder/$DATE/
cp $(find ~/gPodder -type f -ctime -1 -name "*.mp3") ~/.tmp/gPodder/"$DATE"
