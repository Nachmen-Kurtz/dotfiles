#!/bin/sh

mpc idlewait player

while mpc idlewait player; do
    notify-send "MPD" "$(mpc current)"
done
