[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export EDITOR="$(which nano)"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
