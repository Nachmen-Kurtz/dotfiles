#!/bin/sh

[ -f ~/.Xresources ] && xrdb -merge ~/.Xresources
feh --bg-fill ~/.config/i3/wallpaper.jpg
exec dbus-launch --exit-with-session i3
