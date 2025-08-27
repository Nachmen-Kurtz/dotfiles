zstyle ':completion:*' auto-description '%d'
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*:corrections' format '%F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' file-sort modification
zstyle ':completion:*' format '%F{green}%B%d%b%f'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*' ignore-parents parent pwd .. directory
zstyle ':completion:*' insert-tab false
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-prompt '%S%p%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*' matcher-list '' '+r:|[._-]=* r:|=*' '+l:|=*'
zstyle ':completion:*:matches' group yes
zstyle ':completion:*' menu select=long-list select=0
zstyle ':completion:*:messages' format '%F{purple}-- %d --%f'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description yes
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*:rm:*' file-patterns '*:all-files'
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*' select-prompt '%S%p%s'
zstyle ':completion:*' single-ignored show
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:-subscript-:*' tag-order 'indexes' 'parameters'
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:warnings' format '%F{red}-- no matches found --%f'
