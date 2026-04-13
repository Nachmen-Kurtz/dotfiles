#!/bin/sh

setxkbmap -layout us,il -variant , -option grp:alt_shift_toggle
numlockx on

# xrandr \
#   --output eDP-1   --mode 1920x1200 --pos 0x0    --primary \
#   --output DP-3-8  --mode 1920x1080 --pos 3840x0 \
#   --output DP-3-1  --mode 1920x1080 --pos 1920x0


pipewire &
nm-applet &
gpodder &
emacs-30.2-gtk+x11 &
keepassxc ~/.secrets/secret_manager.kdbx &
dunst &
redshift -l 32.08:34.78 -t 5700:3500 &
# picom --backend glx --vsync &
