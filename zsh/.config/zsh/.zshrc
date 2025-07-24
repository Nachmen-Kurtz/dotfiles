autoload -Uz compinit
compinit
HISTFILE=~/.histfile
HISTSIZE=1000000
SAVEHIST=1000000
precmd() { print }

source "$ZDOTDIR/bindkeys.zsh"
source "$ZDOTDIR/zstyle.zsh"
source "$ZDOTDIR/aliases.zsh"
source "$ZDOTDIR/functions.zsh"
source "$ZDOTDIR/options.zsh"
source "$ZDOTDIR/modules.zsh"
source "$ZDOTDIR/exports.zsh"

. "$HOME/.cargo/env"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
