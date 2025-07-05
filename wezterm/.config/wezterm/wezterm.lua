-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- For example, changing the initial geometry for new windows:
config.initial_cols = 100
config.initial_rows = 28
config.enable_tab_bar = false
config.enable_wayland = true

-- or, changing the font size and color scheme.
config.font_size = 12
config.font = wezterm.font("FiraCode Nerd Font")
config.color_scheme = "Catppuccin Mocha"

-- Finally, return the configuration to wezterm:
return config
