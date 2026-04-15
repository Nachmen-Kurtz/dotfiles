#!/bin/sh

setxkbmap -layout us,il -variant , -option grp:alt_shift_toggle
numlockx on

pipewire &
nm-applet &
gpodder &
emacs &
keepassxc ~/.secrets/secret_manager.kdbx &
dunst &
redshift -l 32.08:34.78 -t 5700:3500 &
picom --backend glx --vsync &
