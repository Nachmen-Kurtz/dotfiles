# -------------------------
# --- General & System ---
# -------------------------
# Config files
alias bz='bat $HOME/.zshrc'
alias ez='e $HOME/.zshrc'
alias soz='source $HOME/.zshrc'

# Basic system commands
alias c='clear'
alias e='$EDITOR'
alias q='echo $?'
alias x='exit'

# Utilities
alias te='gnome-text-editor'
alias tldr='tldr -t base16'

alias updates="bat /home/nachmen/Desktop/updates.zsh"
alias cat='bat'

# File and directory listing
# alias ls='lsd --oneline'
alias tr='eza -T --icons'

# Clipboard utilities
alias cpfile='xclip -selection clipboard'
alias cppath='pwd | xclip -selection clipboard'

alias docker='podman'
alias p3g="ping -c 3 8.8.8.8"

#----
# git
#----
alias ga='git add'
alias gar='git add .'
alias gcmsg='git commit -m'
alias gst='git status'
alias gd='git diff'

#---
# terraform
#---
alias tf='terraform'



alias open="xdg-open"
alias rss="podman start freshrss"
alias p="pwd"
