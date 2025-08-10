# Quick file backup function
# Usage: bkp <filename>
# function bkp() {
#   cp -a "$1" "$1.bak"
# }

########################################
########################################

# Function to create a new Rust project without a Git repository
function cargonogit() {
	# Check if a project name was provided
	if [ -z "$1" ]; then
		echo "Error: A project name must be provided."
		echo "Usage: cargonogit <project-name>"
		return 1
	fi

	# Running the cargo new command with the --vcs none flag
	cargo new "$1" --vcs none
}

########################################
########################################

# A function that runs a command and passes its help output to less
function h() {
    # Check if the command exists
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "Error: Command '$1' not found" >&2
        return 1
    fi

    # Help flag list
    local help_flags=("--help" "-h" "-?" "--usage")
    local is_help=0

    # Check if there is a help flag
    for arg in "$@"; do
        for flag in "${help_flags[@]}"; do
            if [[ "$arg" == "$flag" ]]; then
                is_help=1
                break
            fi
        done
        [[ $is_help -eq 1 ]] && break
    done

    # If a help flag is detected, run with less; otherwise, run as usual
    if [[ $is_help -eq 1 ]]; then
        command "$@" 2>&1 | less -R
    else
        command "$@"
    fi
}
