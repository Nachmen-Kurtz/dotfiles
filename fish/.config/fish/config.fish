if status is-interactive
    if command -q fastfetch
        printf \n && fastfetch -c examples/13.jsonc -l void2 && printf \n
    end
end
