#!/bin/bash
source $HOME/.system/shell_config/env_var
mkdir /run/media/nachmen/9C33-6BBD/gPodder/$DATE
find ~/Downloads -type f -mtime -1 -name "*.mp3" -exec mv -t /run/media/nachmen/9C33-6BBD//gPodder/$DATE/ {} +
