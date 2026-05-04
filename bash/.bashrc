[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='[\u@\h \W]\$ '

export EDITOR="$(which nano)"
export VISUAL="$EDITOR"
export SUDO_EDITOR="$EDITOR"
