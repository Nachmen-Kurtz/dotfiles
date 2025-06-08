# my custom aliases
# -----------------


# read .zshrc file
alias cz='cat $HOME/.zshrc'


alias bz='bat $HOME/.zshrc'


# edit .zshrc file
alias ez="e $HOME/.zshrc"


# reload .zshrc file
alias soz='source $HOME/.zshrc'


# copy backgrounds
alias cb='$HOME/.system/shell_scripts/background.sh'


# edit files (with default texy editor)
alias e='$EDITOR'


# clear command
alias c='clear'


# exit as x
alias x='exit'




# Show status exit code in the Shell:
alias q='echo $?'


# cd directory to the temporory directory
alias t='cd $HOME/.tmp'


# best tree view forfile system
alias tr='eza -T --icons'




alias bz='bat $HOME/.zshrc'


alias cat='bat --wrap=never'



alias ez='e /home/nachmen/.zshrc'


alias pm=podman


alias te=gnome-text-editor


alias tf=terraform




alias blabla="genact -m cargo"




# Now containers is only Podman
alias docker="podman"


# tldr pages with colors
alias tldr='tldr -t base16'


# Find aliases, fasted with fzf
alias alla='alias | fzf'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gbl='git blame -w'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'


alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gco='git checkout'
alias gcor='git checkout --recurse-submodules'
alias gcb='git checkout -b'
alias gcB='git checkout -B'
alias gclean='git clean --interactive -d'
alias gcl='git clone --recurse-submodules'

alias gcam='git commit --all --message'
alias gcas='git commit --all --signoff'
alias gcasm='git commit --all --signoff --message'
alias gcs='git commit --gpg-sign'
alias gcss='git commit --gpg-sign --signoff'
alias gcssm='git commit --gpg-sign --signoff --message'
alias gcmsg='git commit --message'
alias gcsm='git commit --signoff --message'
alias gc='git commit --verbose'
alias gca='git commit --verbose --all'
alias gca!='git commit --verbose --all --amend'
alias gcan!='git commit --verbose --all --no-edit --amend'
alias gcans!='git commit --verbose --all --signoff --no-edit --amend'
alias gcann!='git commit --verbose --all --date=now --no-edit --amend'
alias gc!='git commit --verbose --amend'
alias gcn='git commit --verbose --no-edit'
alias gcn!='git commit --verbose --no-edit --amend'
alias gcf='git config --list'
alias gcfu='git commit --fixup'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'

alias gfo='git fetch origin'
alias gg='git gui citool'
alias gga='git gui citool --amend'
alias ghh='git help'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
