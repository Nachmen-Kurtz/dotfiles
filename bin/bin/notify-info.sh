#!/usr/bin/env bash

case "$1" in
    time)
        notify-send 'Time' "$(date +'%H:%M')" ;;
    date)
        notify-send 'Date' "$(date +'%A, %B %d %Y')" ;;
    battery)
        notify-send 'Battery' "$(cat /sys/class/power_supply/BAT0/capacity)% ($(cat /sys/class/power_supply/BAT0/status))" ;;
    light)
        notify-send 'Brightness' "$(brightnessctl -m | cut -d, -f4)" ;;
    volume)
        vol=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1)
        mute=$(pactl get-sink-mute @DEFAULT_SINK@ | awk '{print $2}')
        [[ "$mute" == "yes" ]] && status="$vol (muted)" || status="$vol"
        notify-send 'Volume' "$status" ;;
esac
