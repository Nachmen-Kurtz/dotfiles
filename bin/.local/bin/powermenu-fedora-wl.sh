#!/usr/bin/env bash

case "$(printf "kill\nzzz\nreboot\nshutdown" | fuzzel -d -l 4)" in
	kill) ps -u "$USER" -o pid,comm,%cpu,%mem | fuzzel -d -l 10 -p "Kill: " | awk '{print $1}' | xargs -r kill ;;
	zzz) swaylock & systemctl suspend ;;
	reboot) systemctl reboot ;;
	shutdown) systemctl poweroff ;;
	*) exit 1 ;;
esac
