function vscodium --wraps='flatpak run com.vscodium.codium' --description 'alias vscodium flatpak run com.vscodium.codium'
    flatpak run com.vscodium.codium $argv
end
