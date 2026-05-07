#!/bin/sh
SCHEMA="org.gnome.desktop.interface"

current=$(gsettings get $SCHEMA gtk-theme)

if echo "$current" | grep -qi "dark"; then
    gsettings set $SCHEMA gtk-theme      "WhiteSur-Light-nord"
    gsettings set $SCHEMA icon-theme     "WhiteSur"
    gsettings set $SCHEMA color-scheme   "prefer-light"
else
    gsettings set $SCHEMA gtk-theme      "WhiteSur-Dark-nord"
    gsettings set $SCHEMA icon-theme     "WhiteSur-dark"
    gsettings set $SCHEMA color-scheme   "prefer-dark"
fi
