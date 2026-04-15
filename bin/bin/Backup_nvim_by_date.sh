#!/bin/bash

source /home/nachmen/.system/shell_config/env_var.zsh

mv ~/.config/nvim{,."$TIME_DATE"}
mv ~/.local/share/nvim{,."$TIME_DATE"}
mv ~/.local/state/nvim{,."$TIME_DATE"}
mv ~/.cache/nvim{,."$TIME_DATE"}

echo "Success!"
