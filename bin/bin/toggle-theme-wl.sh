#!/bin/sh
SCHEMA="org.gnome.desktop.interface"

current=$(gsettings get $SCHEMA gtk-theme)

if echo "$current" | grep -q "dark"; then
    gsettings set $SCHEMA gtk-theme      "Adwaita"
    gsettings set $SCHEMA icon-theme     "WhiteSur"
    gsettings set $SCHEMA color-scheme   "prefer-light"
else
    gsettings set $SCHEMA gtk-theme      "Adwaita-dark"
    gsettings set $SCHEMA icon-theme     "WhiteSur-dark"
    gsettings set $SCHEMA color-scheme   "prefer-dark"
fi
