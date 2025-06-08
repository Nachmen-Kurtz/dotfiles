# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#  Custom Aliases
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# -----------------
# Shell & Configuration
# -----------------
# These aliases help manage the .zshrc configuration file itself.

# Edit .zshrc file with the default editor
alias ez='e $HOME/.zshrc'

# View .zshrc file with syntax highlighting
alias bz='bat $HOME/.zshrc'

# Reload .zshrc configuration
alias soz='source $HOME/.zshrc'

# Find a specific alias quickly using fzf
alias alla='alias | fzf'


# -----------------
# System Navigation & Interaction
# -----------------
# Common shortcuts for shell interaction and navigation.

# Clear the terminal screen
alias c='clear'

# Exit the current shell session
alias x='exit'

# Show the exit code of the last executed command
alias q='echo $?'

# Change directory to the temporary folder
alias t='cd $HOME/.tmp'


# -----------------
# File & Directory Management
# -----------------
# Aliases for working with files and directories.

# Use the default text editor (defined by the $EDITOR variable)
alias e='$EDITOR'

# A better 'tree' command with icons
alias tr='eza -T --icons'

# Replace 'cat' with 'bat' for syntax highlighting (without wrapping lines)
alias cat='bat --wrap=never'

# Custom script to copy backgrounds
alias cb='$HOME/.system/shell_scripts/background.sh'


# -----------------
# Application & Tool Shortcuts
# -----------------
# Quick-launch aliases for various applications and tools.

# GNOME Text Editor
alias te='gnome-text-editor'

# Terraform
alias tf='terraform'

# Get tldr pages with 'base16' theme for better colors
alias tldr='tldr -t base16'


# -----------------
# Container Management
# -----------------
# Aliases for working with containers, using Podman as the primary tool.

# Use 'podman' as the default container engine
alias pm='podman'
alias docker='podman'


# -----------------
# Miscellaneous & Fun
# -----------------
# Just for fun.

# Generate a fake cargo build process
alias blabla='genact -m cargo'
