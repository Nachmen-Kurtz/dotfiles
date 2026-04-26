function mypip --description 'show public IP'
    curl -s https://ifconfig.me
    echo
end