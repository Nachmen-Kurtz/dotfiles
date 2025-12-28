function mansec
    set page $argv[1]
    set sec (man $page | col -b | grep -E '^[A-Z][A-Z ]+$' | fzf --prompt='Section> ')
    man $page | col -b | awk -v s="$sec" '
    $0==s {p=1; print; next}
    /^[A-Z][A-Z ]+$/ && p {exit}
    p {print}
  '
end
