function trans-e-h --description 'translate English to Hebrew'
    if command -q trans
        trans -shell -bidi -b en:he $argv
    end
end