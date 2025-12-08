export EDITOR="nvim"
export VISUAL="nvim"
export PATH=$PATH:/usr/local/go/bin
export MANPAGER="sh -c 'awk '\''{ gsub(/\x1B\[[0-9;]*m/, \"\", \$0); gsub(/.\x08/, \"\", \$0); print }'\'' | bat -p -lman'"
