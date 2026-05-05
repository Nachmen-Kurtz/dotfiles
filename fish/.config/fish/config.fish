if status is-interactive
    if command -q fastfetch
        fastfetch -c examples/13.jsonc -l none && printf \n
    end
end

zoxide init fish | source
