fpath+="$ZDOTDIR/completions"

autoload -Uz compinit && compinit

autoload -U +X bashcompinit && bashcompinit

autoload -Uz run-help

complete -C '/usr/local/bin/aws_completer' aws
complete -o nospace -C /home/nachmen/.local/bin/terraform terraform

HISTFILE="$ZDOTDIR/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

precmd() { print }
PROMPT="%F{green}$ %f"

source "$ZDOTDIR/bindkey.zsh"
source "$ZDOTDIR/zstyle.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/export.zsh"
source "$ZDOTDIR/function.zsh"
# source "$ZDOTDIR/zmodload.zsh"

. "$HOME/.cargo/env"
# source <(jj util completion zsh)
# source <(fzf --zsh)
# eval "$(zoxide init zsh)"
