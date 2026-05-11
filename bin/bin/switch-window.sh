#!/bin/sh
items=$(swaymsg -t get_tree \
  | jq -r '.. | objects | select(.type=="con" and .name != null and .name != "") | .name')

count=$(echo "$items" | wc -l)

echo "$items" \
  | fuzzel --dmenu --prompt="  Window: " --lines="$count" \
  | xargs -I{} swaymsg '[title="{}"] focus'
