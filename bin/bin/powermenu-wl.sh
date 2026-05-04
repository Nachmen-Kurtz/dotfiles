#!/usr/bin/env bash

confirm() {
    [ "$(printf "no\nyes" | fuzzel --dmenu -l 2 -p "$1 — Are you sure? ")" = "yes" ]
}
case "$(printf "lock\nsuspend\nkill\nreboot\nshutdown\nexit sway" | fuzzel --dmenu -l 6 -p "Power: ")" in
    lock)        swaylock -f ;;
    suspend)     swaylock -f & sleep 0.5 && loginctl suspend ;;
    kill)        ps -u "$USER" -o pid,comm,%cpu,%mem | fuzzel --dmenu -p "Kill: " | awk '{print $1}' | xargs -r kill ;;
    reboot)      confirm "Reboot"    && loginctl reboot ;;
    shutdown)    confirm "Shutdown"  && loginctl poweroff ;;
    "exit sway") confirm "Exit Sway" && swaymsg exit ;;
    *)           exit 1 ;;
esac
