complete -C '/usr/local/bin/aws_completer' aws
complete -C /opt/opentofu/tofu tofu

source <(fzf --bash)
