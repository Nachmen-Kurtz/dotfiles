
function __complete_tofu
    set -lx COMP_LINE (commandline -cp)
    test -z (commandline -ct)
    and set COMP_LINE "$COMP_LINE "
    /opt/opentofu/tofu
end
complete -f -c tofu -a "(__complete_tofu)"

