#!/bin/sh

wlsunset -l 32.08 -L 34.78 -T 5700 -t 3500 &
nm-applet &
gpodder &
flatpak run io.github.alainm23.planify &
alacritty &
emacs &
keepassxc ~/.secrets/secret_manager.kdbx &
flameshot &
