#!/usr/bin/env bash

confirm() {
    [ "$(printf "no\nyes" | fuzzel --dmenu -l 2 -w 30 -p "$1 — Are you sure? ")" = "yes" ]
}
case "$(printf " lock\n󰒲 suspend\n kill\n reboot\n⏻ shutdown\n󰩈 exit sway" | fuzzel --dmenu -l 6 -w 30 -p "Power: ")" in
    " lock")      swaylock -f ;;
    "󰒲 suspend")   swaylock -f & sleep 0.5 && loginctl suspend ;;
    " kill")      ps -u "$USER" -o pid,comm,%cpu,%mem | grep -v "PID" | fuzzel --dmenu -l 20 -w 35 -p "Kill: " | awk '{print $1}' | xargs -r kill ;;
    " reboot")    confirm " Reboot"    && loginctl reboot ;;
    "⏻ shutdown")  confirm "⏻ Shutdown"  && loginctl poweroff ;;
    "󰩈 exit sway") confirm "󰩈 Exit Sway" && swaymsg exit ;;
    *)           exit 1 ;;
esac
