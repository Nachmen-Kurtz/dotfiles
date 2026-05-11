# ── File Operations ──────────────────────────────────────────
abbr mv    "mv -iv"
abbr cp    "cp -iva"
abbr mkdir "mkdir -vp"
abbr ls    "ls -A"
abbr less  "less -SR"
abbr df    "df -h"
abbr du    "du -sh"
abbr free  "free -h"
abbr psg   "ps aux | grep"

# ── Tmux ─────────────────────────────────────────────────────
abbr t   "tmux"
abbr tc  "tmux attach"
abbr ta  "tmux attach -t"
abbr tad "tmux attach -d -t"
abbr ts  "tmux new -s"
abbr tl  "tmux ls"
abbr tk  "tmux kill-session -t"

# ── GNU Emacs ────────────────────────────────────────────────
abbr e   "emacs -nw"
abbr ec  "emacsclient -nw"
abbr ekg "emacsclient -e '(kill-emacs)'"

# ── Git ──────────────────────────────────────────────────────
abbr g   "git"
abbr gs  "git status"
abbr ga  "git add"
abbr gc  "git commit"
abbr gp  "git push"
abbr gl  "git log --oneline --graph"
abbr gd  "git diff"
abbr gco "git checkout"
abbr gb  "git branch"

# ── Restic ───────────────────────────────────────────────────
abbr res   "restic"
abbr resb  "restic backup"
abbr ressl "restic snapshots"
abbr resr  "restic restore"
abbr resck "restic check"

# ── XBPS — Local ─────────────────────────────────────────────
abbr xql  "xbps-query"
abbr xqlp "xbps-query -l"
abbr xqls "xbps-query -s"
abbr xqld "xbps-query -x"
abbr xqlr "xbps-query -X"
abbr xqlm "xbps-query -m"
abbr xqlf "xbps-query -f"

# ── XBPS — Remote ────────────────────────────────────────────
abbr xqr  "xbps-query -R"
abbr xqrs "xbps-query -Rs"
abbr xqrf "xbps-query -Rf"

# ── XBPS — Actions ───────────────────────────────────────────
abbr xins  "sudo xbps-install"
abbr xsyn  "sudo xbps-install -Su"
abbr xrm   "sudo xbps-remove"
abbr xrmo  "sudo xbps-remove -o"
abbr xrec  "sudo xbps-reconfigure"
abbr xreca "sudo xbps-reconfigure -a"

# ── Runit ────────────────────────────────────────────────────
abbr sv   "sudo sv"
abbr svs  "sudo sv status"
abbr svu  "sudo sv up"
abbr svd  "sudo sv down"
abbr svr  "sudo sv restart"
abbr svsa "sudo sv status /var/service/*"
abbr svl  "ls /var/service"
abbr svla "ls /etc/sv"

# ── Networking ───────────────────────────────────────────────
abbr ssi  "ss -tulnp"
abbr ipa  "ip a"
abbr ipr  "ip r"
abbr myip "curl -s ifconfig.me"

# ── Dotfiles / Stow ──────────────────────────────────────────
abbr stow   "stow -v"
abbr unstow "stow -vD"
abbr restow "stow -vR"

# ── Bluetooth ────────────────────────────────────────────────
abbr blu-41 "bluetoothctl connect 41:42:FF:0B:05:7E"
abbr blu-8E "bluetoothctl connect 8E:9E:5F:16:F6:BE"

# ── Man ──────────────────────────────────────────────────────
abbr upman "sudo makewhatis /usr/share/man"

# ── Meta ─────────────────────────────────────────────────────
abbr abl "cat ~/.config/fish/conf.d/abbr.fish"
abbr abe "eval $EDITOR ~/.config/fish/conf.d/abbr.fish"
