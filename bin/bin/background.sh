#!/bin/bash

source "$HOME/.system/shell_config/env_var.zsh"

if [ ! -d "$HOME/Pictures/Backgrounds" ]; then
  mkdir -p "$HOME/Pictures/Backgrounds"
fi

cp ~/.config/background ~/Pictures/Backgrounds

mv ~/Pictures/Backgrounds/background ~/Pictures/Backgrounds/$TIME_DATE.png
