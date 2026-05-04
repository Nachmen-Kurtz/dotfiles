#!/bin/sh

xrandr \
    --output eDP-1  --mode 1920x1200 --scale 1x1   --pos 0x0    --primary \
    --output DP-3-1 --mode 1920x1080 --scale 0.8x0.8 --pos 1920x0 \
    --output DP-3-8 --mode 1920x1080 --scale 0.8x0.8 --pos 4320x0

i3-msg restart
