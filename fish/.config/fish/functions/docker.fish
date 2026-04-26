function docker --wraps=podman --description 'alias docker podman'
    if command -q podman
        podman $argv
    end
end