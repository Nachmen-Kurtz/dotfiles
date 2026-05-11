#!/bin/sh

CHOICE=$(printf \
'Region\nPoint\nOutput name\nWindow (with border)\nWindow (no border)' \
| fuzzel -l 5 -w 30 --dmenu --prompt '󰹑  Select: ')

case "$CHOICE" in
  'Region')
    slurp | wl-copy ;;
  'Point')
    slurp -p | wl-copy ;;
  'Output name')
    slurp -o -f "%o" | wl-copy ;;
  'Window (with border)')
    swaymsg -t get_tree \
      | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"' \
      | slurp | wl-copy ;;
  'Window (no border)')
    swaymsg -t get_tree \
      | jq -r '.. | select(.pid? and .visible?) | "\(.rect.x+.window_rect.x),\(.rect.y+.window_rect.y) \(.window_rect.width)x\(.window_rect.height)"' \
      | slurp | wl-copy ;;
esac
