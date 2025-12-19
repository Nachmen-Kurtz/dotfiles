function q --wraps='echo 1' --wraps='echo $status' --description 'alias q echo $status'
    echo $status $argv
end
