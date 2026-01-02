abbr jbp0123 "journalctl -b0 -p1 -p2 -p3"
abbr jbp4567 "journalctl -b4 -p5 -p6 -p7"
abbr jb "journalctl -b"
abbr jf "journalctl --follow"
abbr jg "journalctl -b --grep"
abbr ju "journalctl --unit"
abbr t tmux
abbr tc 'tmux attach'
abbr ta 'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts 'tmux new -s'
abbr tl 'tmux ls'
abbr tk 'tmux kill-session -t'
abbr dnfi 'sudo dnf install'
abbr dnfs 'sudo dnf search'
abbr dnfr 'sudo dnf remove'
abbr dnfu 'sudo dnf upgrade --refresh'
abbr dnfuy 'sudo dnf --refresh --assumeyes upgrade'
abbr dnfc 'sudo dnf --refresh check-update'
abbr vim nvim
abbr vi nvim
abbr v nvim
abbr mv "mv -iv"
abbr cp "cp -riv"
abbr mkdir "mkdir -vp"
alias ls="eza --color=always --icons"
alias la 'eza --color=always --icons --all'
alias ll 'eza --color=always --icons --all --long'
abbr l ll
abbr ncdu "ncdu --color dark"
abbr s systemctl
abbr su "systemctl --user"
abbr ss "command systemctl status"
abbr sl "systemctl --type service --state running"
abbr slu "systemctl --user --type service --state running"
abbr se "sudo systemctl enable --now"
abbr sd "sudo systemctl disable --now"
abbr sr "sudo systemctl restart"
abbr so "sudo systemctl stop"
abbr sa "sudo systemctl start"
abbr sf "systemctl --failed --all"
