#!/usr/bin/env bash

confirm() {
    [ "$(printf "no\nyes" | rofi -dmenu -i -l 2 -p "$1 — Are you sure?")" = "yes" ]
}

case "$(printf "lock\nzzz\nkill\nreboot\nshutdown" | rofi -dmenu -i -l 5 -p "Power")" in
    lock)     i3lock --color=1e1e2e --no-unlock-indicator ;;
    zzz)      i3lock --color=1e1e2e --no-unlock-indicator & sleep 0.5 && zzz ;;
    kill)     ps -u "$USER" -o pid,comm,%cpu,%mem | rofi -dmenu -i -l 10 -p "Kill" | awk '{print $1}' | xargs -r kill ;;
    reboot)   confirm "Reboot" && loginctl reboot ;;
    shutdown) confirm "Shutdown" && loginctl poweroff ;;
    *)        exit 1 ;;
esac
