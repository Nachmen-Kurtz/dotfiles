if status is-interactive
    if command -q fastfetch
        fastfetch -c examples/6.jsonc -l void2 && printf \n
    end
end

zoxide init fish | source
