#!/usr/bin/env bash

confirm() {
    [ "$(printf "no\nyes" | fuzzel --dmenu -l 2 -p "$1 — Are you sure? ")" = "yes" ]
}

case "$(printf "lock\nsuspend\nkill\nreboot\nshutdown" | fuzzel --dmenu -l 5 -p "Power: ")" in
    lock)     swaylock -f -c 1e1e2e ;;
    suspend)  swaylock -f -c 1e1e2e & sleep 0.5 && systemctl suspend ;;
    kill)     ps -u "$USER" -o pid,comm,%cpu,%mem | fuzzel --dmenu -p "Kill: " | awk '{print $1}' | xargs -r kill ;;
    reboot)   confirm "Reboot" && systemctl reboot ;;
    shutdown) confirm "Shutdown" && systemctl poweroff ;;
    *)        exit 1 ;;
esac
