export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

[ "$(tty)" = "/dev/tty1" ] && exec dbus-run-session sway > /tmp/sway.log 2>&1
_start_sway() {
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    mkdir -p "$HOME/logs/sway"
    exec dbus-run-session sway > "$HOME/logs/sway/sway-$(date +%Y%m%d-%H%M%S).log" 2>&1
}

[ "$(tty)" = "/dev/tty1" ] && _start_sway

[ -f $HOME/.bashrc ] && . $HOME/.bashrc
