# This is the main configuration file for Fish shell.
# It is sourced every time a new Fish session is started.

# --- 1. Setting Terminal Colors (Theme) ---
# You can customize the colors of various elements in your terminal.
# Use 'fish_config' command to choose predefined themes, or set colors manually.
# For a full list of color options, refer to Fish documentation or 'man fish_color'.

# Command colors
set -g fish_color_command FFE5AC # Color for commands
set -g fish_color_param 95DAE7 # Color for command parameters/arguments
set -g fish_color_redirection FFE5AC # Color for I/O redirection symbols (e.g., '>', '<')
set -g fish_color_end B2DE5E # Color for command terminators (e.g., ';', '&')

# Prompt colors
set -g fish_color_cwd green # Color for the current working directory
set -g fish_color_user brightred # Color for the username
set -g fish_color_host normal # Color for the hostname

# Other useful colors
set -g fish_color_error red # Color for error messages
set -g fish_color_selection --background=brblack # Color for selected text (e.g., in completion menu)
set -g fish_color_search_match --background=brblack # Color for search matches
set -g fish_color_quote yellow # Color for quoted strings
set -g fish_color_autosuggestion brblack # Color for autosuggestions (ghost text)

# --- 2. Setting Paths (PATH) ---
# Add directories to your PATH environment variable so that executables
# within them can be found automatically without specifying the full path.

# Add a personal 'bin' directory to the PATH if it exists
fish_add_path ~/bin

# Add another custom tools directory (e.g., for specific development tools)
# fish_add_path /opt/custom_tools/bin

# --- 3. Defining Aliases (Functions) ---
# In Fish, aliases are defined using functions, which offer more flexibility
# compared to traditional aliases in Bash/Zsh.

# Alias for 'ls -lah' (list all, human-readable, long format)
function ll
    ls -lah $argv
end

# Alias for updating the system (specific to Fedora using dnf)
function update
    sudo dnf upgrade --refresh
end

# Alias for quickly navigating to a common projects directory
function projects
    cd ~/Documents/Projects
end

# --- 4. Enabling Automatic 'cd' ---
# Fish can automatically 'cd' into a directory if you type its name.
# Uncomment the line below to enable this feature.
set -g fish_auto_cd true

# --- 5. Setting Environment Variables ---
# Define global environment variables that will be available in all Fish sessions
# and to processes launched from Fish.
# Use '-g' for global scope and '-x' to export to child processes.

# Set default text editor
set -gx EDITOR vim

# Set a custom environment variable for project roots (example)
# set -gx MY_PROJECT_ROOT /home/your_user/my_awesome_project

# --- 6. Customizing the Prompt (Optional) ---
# The prompt is the text displayed before you type a command.
# You can customize it by defining the 'fish_prompt' function.

function fish_prompt
    # User and host part
    set_color $fish_color_user
    echo -n (whoami)
    set_color $fish_color_host
    echo -n "@"(hostname -s)" "

    # Current working directory part
    set_color $fish_color_cwd
    echo -n (prompt_pwd)

    # Git status (if inside a Git repository)
    # This assumes 'fish_git_prompt' is available (often provided by third-party plugins or Fish itself)
    if test -n "$__fish_git_prompt_show_informative_status"
        set_color yellow
        echo -n (fish_git_prompt)
    end

    # Reset color and add the prompt symbol
    set_color normal
    echo -n "> "
end

# --- 7. Smart Command History Settings ---
# Fish offers intelligent auto-completion and history.
# You can configure history behavior here.

# Set maximum number of entries in command history
set -g history_max_entries 10000

# Ignore commands starting with a space from being saved in history
set -g history_ignore_space true
