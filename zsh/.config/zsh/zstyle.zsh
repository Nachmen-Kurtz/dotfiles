# =============================================================================
# ZSH COMPLETION STYLES (zstyle)
# =============================================================================

# Basic completion behavior
zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

# Completion menu and selection
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*' select-prompt '%S%p%s'
zstyle ':completion:*' list-prompt '%S%p%s'
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' insert-unambiguous true

# Colors and formatting
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' format '%F{green}%B%d%b%f'
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'

# Grouping and organization
zstyle ':completion:*' group-name ''
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' single-ignored show
zstyle ':completion:*' verbose yes

# Matching and fuzzy completion
zstyle ':completion:*' matcher-list '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true

# File and directory handling
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' list-suffixes true

# Command-specific completions
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:rm:*' file-patterns '*:all-files'
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other

# History completion
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# Options and parameters
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description yes
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'

# Advanced completion settings
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' path-completion false
zstyle ':completion:*' fake-files '/etc/hosts' 'hosts'

# Kill process completion
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:*:kill:*:processes' command 'ps -u $USER -o pid,user,cmd'

# SSH completion
zstyle ':completion:*:*:ssh:*' tag-order 'hosts' 'accounts' 'users'
zstyle ':completion:*:*:ssh:*:hosts' hosts "$HOME/.ssh/known_hosts" /etc/hosts
zstyle ':completion:*:*:scp:*' tag-order 'hosts' 'files' 'accounts' 'users'

# Git completion
zstyle ':completion:*:*:git:*' script "$HOME/.local/bin/git-completion.bash" 2>/dev/null || true

# Docker completion
zstyle ':completion:*:*:docker:*' script "$HOME/.local/bin/docker-completion.bash" 2>/dev/null || true
