#!/bin/sh

PICTURES="$HOME/screenshots"
STAMP=$(date +'%s_grim.png')

CHOICE=$(printf \
'Screen  → file\nScreen  → clipboard\nRegion  → file\nRegion  → clipboard\nWindow  → file\nMonitor → file\nPick color' \
| fuzzel -l 7 -w 30 --dmenu --prompt '󰹑  Screenshot: ')

case "$CHOICE" in
  'Screen  → file')
    grim "$PICTURES/$STAMP" ;;
  'Screen  → clipboard')
    grim - | wl-copy ;;
  'Region  → file')
    grim -g "$(slurp)" "$PICTURES/$STAMP" ;;
  'Region  → clipboard')
    grim -g "$(slurp)" - | wl-copy ;;
  'Window  → file')
    grim -T "$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).foreign_toplevel_identifier')" "$PICTURES/$STAMP" ;;
  'Monitor → file')
    grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "$PICTURES/$STAMP" ;;
  'Pick color')
    grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -1 | awk '{print $3}' | wl-copy ;;
esac
