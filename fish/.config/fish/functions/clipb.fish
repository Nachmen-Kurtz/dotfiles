function clipb --wraps='xclip -selection clipboard' --description 'copy stdin to clipboard'
    if command -q xclip
        xclip -selection clipboard $argv
    end
end