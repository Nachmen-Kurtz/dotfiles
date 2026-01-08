function startup_apps --wraps='ls ~/.config/autostart/' --description 'alias startup_apps ls ~/.config/autostart/'
    ls ~/.config/autostart/ $argv
end
