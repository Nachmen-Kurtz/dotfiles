#!/bin/sh

xrandr \
    --output eDP-1  --mode 1920x1200 --scale 1x1 --primary \
    --output DP-3-1 --off \
    --output DP-3-8 --off

i3-msg restart
