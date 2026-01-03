# settings.sh - Merged settings from various files

# From completion.sh
complete -C '/usr/local/bin/aws_completer' aws
complete -C /opt/opentofu/tofu tofu

# From env.sh
. "$HOME/.cargo/env"

# From shopt.sh
shopt -s autocd

# From export.sh
export EDITOR="nvim"
export VISUAL="nvim"
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"

# From source.sh
# source /home/nachmen/.config/broot/launcher/bash/br
source <(fzf --bash)
