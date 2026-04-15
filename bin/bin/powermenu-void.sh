#!/usr/bin/env bash

case "$(printf "lock\nzzz\nkill\nreboot\nshutdown" | rofi -dmenu -i -l 5 -p "Power")" in
    lock)     i3lock --color=1e1e2e --no-unlock-indicator ;;
    zzz)      i3lock --color=1e1e2e --no-unlock-indicator & sleep 0.5 && zzz ;;
    kill)     ps -u "$USER" -o pid,comm,%cpu,%mem | rofi -dmenu -i -l 10 -p "Kill" | awk '{print $1}' | xargs -r kill ;;
    reboot)   loginctl reboot ;;
    shutdown) loginctl poweroff ;;
    *)        exit 1 ;;
esac
