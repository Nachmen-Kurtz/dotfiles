#!/usr/bin/env bash

case "$1" in
    time)    notify-send 'Time'    "$(date +'%H:%M')" ;;
    date)    notify-send 'Date'    "$(date +'%A, %B %d %Y')" ;;
    battery) notify-send 'Battery' "$(cat /sys/class/power_supply/BAT0/capacity)% ($(cat /sys/class/power_supply/BAT0/status))" ;;
esac
