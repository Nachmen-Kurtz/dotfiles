function fzf --description "fzf with bat preview"
    if command -q fzf
        if command -q bat
            command fzf --preview 'bat --color=always {}' $argv
        else
            command fzf $argv
        end
    end
end
