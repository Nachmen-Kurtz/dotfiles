function tez --wraps='eza -T --icons' --description 'tree view with eza'
    if command -q eza
        eza -T --icons $argv
    end
end