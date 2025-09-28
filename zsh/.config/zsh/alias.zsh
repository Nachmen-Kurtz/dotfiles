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

unalias run-help

alias open="xdg-open"
alias rss="podman start freshrss"
alias p="pwd"
alias clipb="xclip -selection clipboard"
alias n-c='nu -c'
alias ls=lsd
alias terraform=tofu
alias myip="curl http://ipecho.net/plain; echo"
