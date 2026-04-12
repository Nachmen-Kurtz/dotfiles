#!/bin/bash

BAT=/sys/class/power_supply/BAT0
CAPACITY=$(cat "$BAT/capacity" 2>/dev/null)
STATUS=$(cat "$BAT/status" 2>/dev/null)
CACHE=/tmp/battery_last_notified

if [ "$STATUS" = "Charging" ] || [ "$STATUS" = "Full" ]; then
    rm -f "$CACHE"
    exit 0
fi

if [ "$CAPACITY" -le 10 ]; then
    LAST=$(cat "$CACHE" 2>/dev/null || echo 100)
    if [ "$CAPACITY" -lt "$LAST" ]; then
        notify-send -u critical "Battery Low" "${CAPACITY}% remaining"
        echo "$CAPACITY" > "$CACHE"
    fi
fi
