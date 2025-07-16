# -------------------------
# --- General & System ---
# -------------------------
# Config files
alias bz='bat $HOME/.zshrc'
alias ez='e $HOME/.zshrc'
alias soz='source $HOME/.zshrc'

# Basic system commands
alias c='clear'
alias e='$EDITOR'
alias q='echo $?'
alias x='exit'

# Search and filter
alias alla='alias | fzf'
alias hf='history | fzf'

# Utilities
# alias pkf='ps aux | fzf | awk "{ print \$2 }" | xargs kill -9'
alias te='gnome-text-editor'
alias tldr='tldr -t base16'

alias updates="bat /home/nachmen/Desktop/updates.zsh"
alias cat='bat'

# --------------------------
# --- Navigation & Files ---
# --------------------------
# File system navigation and search
alias cf='code $(fzf)'
alias pfg='find . -type f | fzf'
alias rf='rm -i $(fzf)'
alias vf='nvim $(fzf)'

# File and directory listing
# alias ls='lsd --oneline'
alias tr='eza -T --icons'

# Clipboard utilities
alias cpfile='xclip -selection clipboard'
# alias cppath='pwd | xclip -selection clipboard'


# -------------
# --- Git ---
# -------------
# Basic commands
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gb='git branch'
alias gcb='git checkout -b'
alias gcl='git clone'
alias gco='git checkout'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --oneline --graph --decorate'
alias gp='git push'
alias gpl='git pull'
alias gpo='git push origin'
alias gr='git remote -v'
alias greset='git reset --hard HEAD'
alias gst='git status'
alias gss='git status --short'

# Stash
alias gstash='git stash'
alias gstashp='git stash pop'

# FZF integration
alias gbf='git checkout $(git branch | sed "s/^..//" | fzf)'
alias gdf='git diff $(git ls-files | fzf)'
alias gsf='git stash list | fzf | cut -d: -f1 | xargs git stash apply'

# Utilities
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gap='git apply'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'

alias gbm='git branch --move'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcB='git checkout -B'

alias gcam='git commit --all --message'
alias gcmsg='git commit --message'
alias gc='git commit --verbose'
alias gcf='git config --list'
alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'


alias gfo='git fetch origin'
alias gl='git pull'
alias gpr='git pull --rebase'
alias gprv='git pull --rebase -v'
alias gpra='git pull --rebase --autostash'
alias gprav='git pull --rebase --autostash -v'
alias gp='git push'

alias gr='git remote'
alias grv='git remote --verbose'
alias grs='git restore'
alias grm='git rm'
alias grmc='git rm --cached'
alias gsh='git show'
alias gst='git status'
alias gsw='git switch'
alias gss='git status --short'
alias gsb='git status --short --branch'
alias grss='git restore --source'
alias gra='git remote add'
alias grrm='git remote remove'
alias grmv='git remote rename'
alias grset='git remote set-url'
alias grup='git remote update'
alias grb='git rebase'
# ----------------------
# --- Podman (Docker) ---
# ----------------------
# Set podman as default
alias docker='podman'

# General shortcuts
alias pm='podman'
alias pexec='podman exec -it'
alias pimg='podman images'
alias pins='podman inspect'
alias plogs='podman logs'
alias plogsf='podman logs -f'
alias pnet='podman network ls'
alias prm='podman rm'
alias prmi='podman rmi'
alias prun='podman run -it'
alias pvol='podman volume ls'

# Container management
alias pb='podman build -t'
alias pms='podman ps'
alias psa='podman ps -a'
alias pst='podman start'
alias pstop='podman stop'

alias pbl='podman build'
alias pcin='podman container inspect'
alias pcls='podman container ls'
alias pclsa='podman container ls --all'
alias pib='podman image build'
alias pii='podman image inspect'
alias pils='podman image ls'
alias pipu='podman image push'
alias pirm='podman image rm'
alias pit='podman image tag'
alias plo='podman container logs'
alias pnc='podman network create'
alias pncn='podman network connect'
alias pndcn='podman network disconnect'
alias pni='podman network inspect'
alias pnls='podman network ls'
alias pnrm='podman network rm'
alias ppo='podman container port'
alias ppu='podman pull'
alias pr='podman container run'
alias prit='podman container run --interactive --tty'
alias prm='podman container rm'
alias 'prm!'='podman container rm --force'
alias pst='podman container start'
alias prs='podman container restart'
alias psta='podman stop $(podman ps --quiet)'
alias pstp='podman container stop'
alias ptop='podman top'
alias pvi='podman volume inspect'
alias pvls='podman volume ls'
alias pvprune='podman volume prune'
alias pxc='podman container exec'
alias pxcit='podman container exec --interactive --tty'

# -----------------------------
# --- DNF (Package Manager) ---
# -----------------------------
# Basic operations (require sudo)
alias dnfclean='sudo dnf clean all'
alias dnfins='sudo dnf install'
alias dnfrm='sudo dnf remove'
alias dnfup='sudo dnf upgrade'

# Search and info
alias dnfinfo='dnf info'
alias dnflist='dnf list installed'
alias dnfsearch='dnf search'

# Group management
alias dnfgrp='dnf group list'
alias dnfgrpins='sudo dnf groupinstall'
alias dnfgrprm='sudo dnf groupremove'


# -----------------
# --- Terraform ---
# -----------------
alias tf='terraform'
alias tf='terraform'
alias tfa='terraform apply'
alias tfaa='terraform apply -auto-approve'
alias tfc='terraform console'
alias tfd='terraform destroy'
alias 'tfd!'='terraform destroy -auto-approve'
alias tff='terraform fmt'
alias tffr='terraform fmt -recursive'
alias tfi='terraform init'
alias tfir='terraform init -reconfigure'
alias tfiu='terraform init -upgrade'
alias tfiur='terraform init -upgrade -reconfigure'
alias tfo='terraform output'
alias tfp='terraform plan'
alias tfv='terraform validate'
alias tfs='terraform state'
alias tft='terraform test'
alias tfsh='terraform show'
alias p3g="ping -c 3 8.8.8.8"
