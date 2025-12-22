# =============================================================================
# ZSH OPTIONS (setopt)
# =============================================================================

# === BEHAVIOR OPTIONS ===
setopt AUTO_CD              # Change directory without typing cd
setopt AUTO_PUSHD           # Push directory to stack on cd
setopt PUSHD_IGNORE_DUPS    # Don't push duplicates to stack
setopt PUSHD_SILENT         # Don't print stack after pushd/popd
setopt PUSHD_TO_HOME        # Pushd goes to home directory with no args
setopt CDABLE_VARS          # Change directory to variable name
setopt MULTIOS              # Write to multiple descriptors

# === COMPLETION OPTIONS ===
setopt ALWAYS_TO_END        # Move cursor to end of completion
setopt AUTO_MENU            # Show completion menu on tab
setopt COMPLETE_IN_WORD     # Complete from both ends
setopt AUTO_LIST            # Automatically list choices
setopt AUTO_PARAM_SLASH     # Add trailing slash if needed
setopt AUTO_NAME_DIRS       # Auto add variable names to cd path
setopt LIST_PACKED          # Make completion lists smaller
setopt LIST_TYPES           # Show file types in completion
unsetopt MENU_COMPLETE      # Don't auto-select first option

# === HISTORY OPTIONS ===
setopt APPEND_HISTORY       # Append to history file
setopt EXTENDED_HISTORY     # Save timestamps in history
setopt INC_APPEND_HISTORY   # Append immediately to history
setopt SHARE_HISTORY        # Share history between sessions
setopt HIST_IGNORE_DUPS     # Don't save duplicate commands
setopt HIST_IGNORE_ALL_DUPS # Remove old duplicates if new one added
setopt HIST_FIND_NO_DUPS    # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE    # Don't save commands starting with space
setopt HIST_SAVE_NO_DUPS    # Don't save duplicate entries
setopt HIST_REDUCE_BLANKS   # Remove blanks before saving
setopt HIST_VERIFY          # Verify before executing history commands

# === GLOBBING AND PATTERN MATCHING ===
setopt EXTENDED_GLOB        # Use extended globbing patterns
setopt GLOB_DOTS            # Include dotfiles in globbing
setopt NO_MATCH             # Warn if glob doesn't match
setopt NOMATCH              # Error if no match for glob
setopt MAGIC_EQUAL_SUBST    # Perform = substitution on expansion

# === JOB CONTROL ===
setopt AUTO_CONTINUE        # Continue jobs when disowned
setopt BG_NICE              # Run background jobs at lower priority
setopt CHECK_JOBS           # Check for jobs before exiting
setopt HUP                  # Send HUP to jobs on exit
setopt LONG_LIST_JOBS       # List jobs in long format
setopt NOTIFY               # Report status of background jobs immediately

# === INPUT AND EDITING ===
setopt INTERACTIVE_COMMENTS # Allow comments in interactive shell
setopt PROMPT_SUBST         # Allow substitution in prompts
setopt PROMPT_BANG          # Enable history expansion in prompts
setopt PROMPT_PERCENT       # Enable prompt expansion
setopt TRANSIENT_RPROMPT    # Clear RPROMPT after command
setopt ZLE                  # Use Zsh Line Editor

# === SCRIPTING AND PROGRAMMING ===
setopt FUNCTION_ARGZERO     # Set $0 to function name
setopt LOCAL_OPTIONS        # Allow local options in functions
setopt LOCAL_TRAPS          # Allow local traps in functions
setopt UNSET                # Allow unset parameters

# === MISC OPTIONS ===
setopt BEEP                 # Beep on errors
setopt CORRECT              # Try to correct command spelling
setopt HASH_LIST_ALL        # Hash everything before completion
setopt NO_RCS               # Don't load startup files (commented out)
setopt PRINT_EXIT_VALUE     # Print exit value if non-zero
setopt RC_QUOTES            # Allow 'single''quote' strings
setopt RM_STAR_SILENT       # Don't query on rm *
setopt RM_STAR_WAIT         # Wait 10 seconds before confirming rm *
