local wezterm = require("wezterm") --[[@as Wezterm]]
local config = wezterm.config_builder()
wezterm.log_info("reloading")
local act = wezterm.action

require("links").setup(config)

config.color_scheme = "Tokyo Night Moon"

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

config.font = wezterm.font("JetBrains Mono Nerd")

config.font = wezterm.font_with_fallback({
	-- "FiraCode Nerd Font Mono",
	"JetBrains Mono",
	-- "DejaVu Sans Mono",
	-- "Monospace",
})
config.font_size = 10
config.allow_win32_input_mode = false
config.keys = { { key = " ", mods = "CTRL", action = act.SendKey({ key = " ", mods = "CTRL" }) } }
config.window_background_opacity = 0.95
return config
