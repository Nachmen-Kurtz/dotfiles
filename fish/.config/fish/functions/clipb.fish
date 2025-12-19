function clipb --wraps='xclip -selection clipboard' --description 'alias clipb xclip -selection clipboard'
    xclip -selection clipboard $argv
end
