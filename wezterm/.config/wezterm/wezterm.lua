local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("FiraCode Nerd Font")
config.font_size = 13.0

config.adjust_window_size_when_changing_font_size = false

config.enable_tab_bar = false

-- config.window_background_image = "/home/nachmen/Pictures/Backgrounds/f42/default/f42-01-night.png"
-- config.window_background_image_hsb = {
-- 	brightness = 0.1,
-- 	hue = 1.0,
-- 	saturation = 0.5,
-- }

config.keys = {
	{ key = "p", mods = "CTRL", action = wezterm.action.ShowTabNavigator },
}

return config
