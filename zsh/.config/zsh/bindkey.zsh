###################################################################################
###################################################################################
###################################################################################
###################################################################################
########## Create by AI.###########################################################
##########    Claude    ############################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
# ZSH Key Mappings Configuration

# Set keymap to emacs mode (default)
bindkey -e

# Navigation keys
bindkey "^[[H"    beginning-of-line      # Home key
bindkey "^[[F"    end-of-line            # End key
bindkey "^[[3~"   delete-char            # Delete key
bindkey "^[[1;5C" forward-word           # Ctrl+Right arrow
bindkey "^[[1;5D" backward-word          # Ctrl+Left arrow

# Alternative navigation (for different terminals)
bindkey "^[OH"    beginning-of-line      # Home (alternative)
bindkey "^[OF"    end-of-line            # End (alternative)
bindkey "^[[5~"   up-line-or-history     # Page Up
bindkey "^[[6~"   down-line-or-history   # Page Down

# Word navigation
bindkey "^[f"     forward-word           # Alt+f
bindkey "^[b"     backward-word          # Alt+b

# History navigation
bindkey "^P"      up-line-or-history     # Ctrl+P (previous)
bindkey "^N"      down-line-or-history   # Ctrl+N (next)
bindkey "^[[A"    up-line-or-search      # Up arrow with search
bindkey "^[[B"    down-line-or-search    # Down arrow with search

# Editing shortcuts
bindkey "^A"      beginning-of-line      # Ctrl+A
bindkey "^E"      end-of-line            # Ctrl+E
bindkey "^K"      kill-line              # Ctrl+K (delete to end)
bindkey "^U"      kill-whole-line        # Ctrl+U (delete entire line)
bindkey "^W"      backward-kill-word     # Ctrl+W (delete word back)
bindkey "^[d"     kill-word              # Alt+d (delete word forward)
bindkey "^Y"      yank                   # Ctrl+Y (paste)
bindkey "^T"      transpose-chars        # Ctrl+T (swap characters)
bindkey "^[t"     transpose-words        # Alt+t (swap words)

# Line editing
bindkey "^L"      clear-screen           # Ctrl+L (clear screen)
bindkey "^R"      history-incremental-search-backward  # Ctrl+R (reverse search)
bindkey "^S"      history-incremental-search-forward   # Ctrl+S (forward search)

# Undo/Redo
bindkey "^_"      undo                   # Ctrl+_ (undo)
bindkey "^[_"     redo                   # Alt+_ (redo)

# Case manipulation
bindkey "^[u"     up-case-word           # Alt+u (uppercase word)
bindkey "^[l"     down-case-word         # Alt+l (lowercase word)
bindkey "^[c"     capitalize-word        # Alt+c (capitalize word)

# Special characters and completion
bindkey "^I"      expand-or-complete     # Tab (completion)
bindkey "^[[Z"    reverse-menu-complete  # Shift+Tab (reverse completion)

# Process control
bindkey "^Z"      undo                   # Ctrl+Z remapped to undo (instead of suspend)

# Custom useful bindings
bindkey "^[."     insert-last-word       # Alt+. (insert last word from previous command)
bindkey "^X^E"    edit-command-line      # Ctrl+X Ctrl+E (edit command in editor)

# Accept suggestions (if using autosuggestions manually)
bindkey "^[[1;5C" forward-word           # Ctrl+Right to accept suggestion
bindkey "^F"      forward-char           # Ctrl+F to accept one character

# Terminal specific bindings (uncomment as needed)
# For iTerm2 on macOS:
# bindkey "^[[1;9C" forward-word         # Alt+Right
# bindkey "^[[1;9D" backward-word        # Alt+Left

# For GNU/Linux terminals:
# bindkey "^[^[[C"  forward-word          # Alt+Right
# bindkey "^[^[[D"  backward-word         # Alt+Left

# Enable history search with partial command
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search    # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrowbindkey -e

###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################
###################################################################################

bindkey '^[h' run-help
bindkey '^[H' run-help

