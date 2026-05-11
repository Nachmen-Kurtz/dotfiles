#!/bin/sh

input=$(fuzzel -l 0 --dmenu --prompt=" Run: ")

[ -n "$input" ] && sh -c "$input"
