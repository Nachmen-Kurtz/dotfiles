function ydp --wraps=yt-dlp --description 'yt-dlp with playlist config'
    if command -q yt-dlp
        yt-dlp --config-locations ~/.config/yt-dlp/config-playlist $argv
    end
end