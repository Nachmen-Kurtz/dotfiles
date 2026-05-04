abbr mv    "mv -iv"
abbr cp    "cp -riva"
abbr mkdir "mkdir -vp"
abbr ls    "ls -A"
abbr less  "less -S"

abbr t   "tmux"
abbr tc  'tmux attach'
abbr ta  'tmux attach -t'
abbr tad 'tmux attach -d -t'
abbr ts  'tmux new -s'
abbr tl  'tmux ls'
abbr tk  'tmux kill-session -t'

abbr xins "sudo xbps-install"
abbr xsyn "sudo xbps-install -Su"

abbr xql  "xbps-query"
abbr xqls "xbps-query -s"
abbr xqr  "xbps-query -R"
abbr xqrs "xbps-query -Rs"
abbr xqlp "xbps-query -l"
abbr xqld "xbps-query -x"
abbr xqlr "xbps-query -X"
abbr xqlm "xbps-query -m"
abbr xqlf "xbps-query -f"
abbr xqrf "xbps-query -Rf"

abbr xrm  "sudo xbps-remove"
abbr xrmo "sudo xbps-remove -o"

abbr sv   "sudo sv"
abbr svs  "sudo sv status"
abbr svu  "sudo sv up"
abbr svd  "sudo sv down"
abbr svr  "sudo sv restart"
abbr svsa "sudo sv status /var/service/*"
abbr svl  "ls /var/service"
abbr svla "ls /etc/sv"

abbr abl "cat ~/.config/fish/conf.d/abbr.fish"
