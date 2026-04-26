set -gx EDITOR      (which nano)
set -gx VISUAL      $EDITOR
set -gx SUDO_EDITOR $EDITOR
set -gx SHELL       /usr/bin/fish

set -gx fish_cursor_default     block
set -gx fish_cursor_insert      line blink
set -gx fish_cursor_visual      block
set -gx fish_cursor_replace_one underscore

set fish_greeting
