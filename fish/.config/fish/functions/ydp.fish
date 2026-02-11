function ydp --wraps='yt-dlp --config-locations .config/yt-dlp/config-playlist' --description 'alias ydp yt-dlp --config-locations .config/yt-dlp/config-playlist'
    yt-dlp --config-locations .config/yt-dlp/config-playlist $argv
end
