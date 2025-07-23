
setopt autocd beep extendedglob nomatch notify

# ==
# === History and navigation improvements ===
# ==

# Share history between all open terminals instantly
setopt SHARE_HISTORY

setopt INC_APPEND_HISTORY

# Do not add a command to history if it is the same as the previous command
setopt HIST_IGNORE_DUPS

# Do not add commands that start with a space
setopt HIST_IGNORE_SPACE

# Keep the directory stack free of duplicates
setopt PUSHD_IGNORE_DUPS

# Navigate directories using pushd/popd silently, without printing the list each time
setopt PUSHD_SILENT

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD


