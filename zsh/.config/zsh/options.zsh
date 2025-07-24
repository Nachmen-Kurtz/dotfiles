
setopt autocd beep extendedglob nomatch notify

# ==
# === History and navigation improvements ===
# ==

# Share history between all open terminals instantly
setopt SHARE_HISTORY

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY 

# Add comamnds as they are typed, don't wait until shell exit
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


# Include more information about when the command was executed, etc
setopt EXTENDED_HISTORY

# When completing from the middle of a word, move the cursor to the end of the word
setopt ALWAYS_TO_END 

# Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt PROMPT_SUBST

unsetopt MENU_COMPLETE
setopt AUTO_MENU
