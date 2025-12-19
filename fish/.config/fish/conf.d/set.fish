set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR

set -x MANPAGER "nvim +Man!"

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

set FZF_DEFAULT_OPTS "--layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

set fish_greeting # Supresses fish's intro message
