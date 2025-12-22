function cwd --wraps='pwd | xclip -selection clipboard' --description 'alias cwd pwd | xclip -selection clipboard'
    pwd | xclip -selection clipboard $argv
end
