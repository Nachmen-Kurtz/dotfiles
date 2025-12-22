function mypip --wraps='curl https://ifconfig.me' --wraps='curl https://ifconfig.me && echo' --description 'alias mypip curl https://ifconfig.me && echo'
    curl https://ifconfig.me && echo $argv
end
