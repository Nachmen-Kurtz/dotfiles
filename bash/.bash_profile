# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

# User specific environment and startup programs

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/nachmen/.lmstudio/bin"
# End of LM Studio CLI section

tldr -r
