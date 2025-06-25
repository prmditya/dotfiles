-- ~/.wezterm.lua

local wezterm = require("wezterm")

return {
	-- Font Config
	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 12.0,

	-- Theme Config (Gruvbox)
	color_scheme = "Gruvbox Material (Gogh)",

	-- General Terminal Config
	adjust_window_size_when_changing_font_size = false,
	enable_tab_bar = true,
	enable_wayland = false,
	window_decorations = "NONE",
	window_background_opacity = 0.7,

	-- Tab
	hide_tab_bar_if_only_one_tab = true,

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},
}
