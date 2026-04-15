#!/usr/bin/env bash

case "$(printf "kill\nzzz\nreboot\nshutdown" | rofi -dmenu -i -l 4 -p "Power")" in
	kill) ps -u "$USER" -o pid,comm,%cpu,%mem | rofi -dmenu -i -l 10 -p "Kill" | awk '{print $1}' | xargs -r kill ;;
	zzz) slock zzz ;;
	reboot) loginctl reboot ;;
	shutdown) loginctl poweroff ;;
	*) exit 1 ;;
esac
