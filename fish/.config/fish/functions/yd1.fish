function yd1 --wraps=yt-dlp --description 'download with yt-dlp'
    if command -q yt-dlp
        yt-dlp $argv
    end
end