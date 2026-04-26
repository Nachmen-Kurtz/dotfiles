if status is-interactive
    # Commands to run in interactive sessions can go here
    echo ""
    if command -q fastfetch
       fastfetch
    end
    echo ""
end
