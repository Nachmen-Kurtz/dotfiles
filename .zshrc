# ------------------------------------------------------------------------------
# Environment Variables and Zsh Environment
# ------------------------------------------------------------------------------

# Source environment variables. This is often done early to ensure
# paths and variables are set for other scripts.
source "$HOME/.zshenv"

# Set the installation directory for Oh My Zsh.
export ZSH="$HOME/.oh-my-zsh"

# ------------------------------------------------------------------------------
# Oh My Zsh Configuration
# ------------------------------------------------------------------------------

# Define the plugins that Oh My Zsh will load.
plugins=(
  git
  copyfile
  copypath
  podman
  man
  aliases
  zsh-syntax-highlighting
)

# Load Oh My Zsh.
source "$ZSH/oh-my-zsh.sh"

# For starship prompt
eval "$(starship init zsh)"

# ------------------------------------------------------------------------------
# Initialize External Tools
# ------------------------------------------------------------------------------

# Initialize fzf (fuzzy finder) shell integrations.
source <(fzf --zsh)

# Initialize zoxide, a smarter 'cd' command.
eval "$(zoxide init zsh)"

# ------------------------------------------------------------------------------
# Custom User Files
# ------------------------------------------------------------------------------

# Source custom aliases for your shell.
source "$HOME/.aliases.zsh"

