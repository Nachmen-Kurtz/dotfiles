function manb --wraps=man --description 'Show man page using bat'
    if test (count $argv) -eq 0
        echo "Usage: manb <command>"
        return 1
    end
    
    command man $argv | bat -l man --no-config --style plain
end
