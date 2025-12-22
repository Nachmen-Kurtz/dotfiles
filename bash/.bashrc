# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
  PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
  for rc in ~/.bashrc.d/*; do
    if [ -f "$rc" ]; then
      . "$rc"
    fi
  done
fi
unset rc

PATH="/usr/lib64/ccache:/usr/local/bin:/usr/bin"
PATH="$HOME/.opencode/bin:$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"
PATH="$PATH:/usr/local/go/bin"
export PATH
. "$HOME/.cargo/env"


complete -C /opt/opentofu/tofu tofu
