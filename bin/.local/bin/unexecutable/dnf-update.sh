#!/bin/bash

# The file of all my customizetion - source by any running shell

source "$HOME/.system/shell_config/env_var.zsh"
dnf check-update >"$HOME/System/Logs/DNF/$DATE"
