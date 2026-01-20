set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR
set -gx SHELL /usr/bin/fish

set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# set -gx GNOME_KEYRING_CONTROL /run/user/$UID/keyring
# set -gx SSH_AUTH_SOCK /run/user/$UID/keyring/ssh

set fish_greeting
