# for starship prompt
eval "$(starship init zsh)"


# This is for complait terraform commands:
# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/bin/terraform terraform


# zoxide command
eval "$(zoxide init zsh)"


# fzf
source <(fzf --zsh)


# yazi configuretions:
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}


# For kubectl command completion:
autoload -Uz compinit
compinit
source <(kubectl completion zsh)

# jj
source <(COMPLETE=zsh jj)
