function cwd --description 'copy current path to clipboard'
    if command -q xclip
        pwd | xclip -selection clipboard
    end
end