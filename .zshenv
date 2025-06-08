# ================================
#   Zsh Environment Configuration
# ================================

# -------------------------------
# Cargo Package Manager
# -------------------------------

# Load Cargo environment variables
. "$HOME/.cargo/env"

# -------------------------------
# Default Editors
# -------------------------------

# Set Neovim as the default CLI editor
export EDITOR="nvim"
export VISUAL="nvim"

# Use Neovim as the man page viewer
export MANPAGER='nvim +Man!'

# -------------------------------
# Date and Time Exports
# -------------------------------

# Export current date (DD-MM-YY)
export DATE="$(date +'%d-%m-%y')"

# Export current date and time (DD-MM-YY_HH:MM:SS)
export TIME_DATE="$(date +'%d-%m-%y_%H:%M:%S')"

# -------------------------------
# Project and Development Paths
# -------------------------------

# Set default directory for all Git repositories
export GIT_REPOS="$HOME/Desktop/git"

# Set path to dotfiles directory
export DOTFILES="$HOME/dotfiles"

# -------------------------------
# PATH Modifications
# -------------------------------

# Add local binaries (e.g. Zed editor) to PATH
export PATH="$HOME/.local/bin:$PATH"

# -------------------------------
# Ruby Gems Configuration
# -------------------------------

# Install Ruby gems to user directory
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"

