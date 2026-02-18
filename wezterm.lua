local wezterm = require("wezterm")
local config = wezterm.config_builder({})

config.color_scheme = "Gruvbox Dark (Gogh)"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 18.0

config.enable_tab_bar = false
config.window_decorations = "RESIZE"

config.window_close_confirmation = "NeverPrompt"
config.keys = {
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
