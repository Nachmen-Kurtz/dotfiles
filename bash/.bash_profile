# .bash_profile

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

[ -f $HOME/.bashrc ] && . $HOME/.bashrc
