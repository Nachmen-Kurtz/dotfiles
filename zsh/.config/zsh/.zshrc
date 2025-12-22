fpath+="$ZDOTDIR/completions"

autoload -Uz compinit promptinit run-help && compinit && promptinit
autoload -U +X bashcompinit && bashcompinit

complete -C '/usr/local/bin/aws_completer' aws
complete -C /usr/bin/tofu tofu

HISTFILE="$ZDOTDIR/zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

precmd() { print }
PROMPT="%F{green}$ %f"
# prompt off

source "$ZDOTDIR/bindkey.zsh"
source "$ZDOTDIR/zstyle.zsh"
source "$ZDOTDIR/alias.zsh"
source "$ZDOTDIR/setopt.zsh"
source "$ZDOTDIR/export.zsh"
source "$ZDOTDIR/function.zsh"
# source "$ZDOTDIR/zmodload.zsh"

. "$HOME/.cargo/env"
source <(jj util completion zsh)
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
