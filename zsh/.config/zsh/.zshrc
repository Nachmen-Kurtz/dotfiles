autoload -Uz compinit
compinit
HISTFILE="$ZDOTDIR/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000
precmd() { print }
PROMPT="%B%F{green}$ %f%b"

source "$ZDOTDIR/bindkey.zsh"
source "$ZDOTDIR/zstyle.zsh"
source "$ZDOTDIR/alias.zsh"
# source "$ZDOTDIR/function.zsh"
source "$ZDOTDIR/setopt.zsh"
# source "$ZDOTDIR/zmodload.zsh"
source "$ZDOTDIR/export.zsh"

. "$HOME/.cargo/env"
# source <(fzf --zsh)
# eval "$(zoxide init zsh)"
