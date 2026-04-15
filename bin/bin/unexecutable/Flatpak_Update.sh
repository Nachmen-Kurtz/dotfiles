#!/bin/bash

flatpak_logs_dir="$HOME/Logs/Flatpak"

if [ ! -d "$flatpak_logs_dir" ]; then
    mkdir -p "$flatpak_logs_dir"
fi



#flatpak update -y > $HOME/Logs/Flatpak
