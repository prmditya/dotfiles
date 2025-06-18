-- ~/.wezterm.lua

local wezterm = require("wezterm")

return {
	-- Font Config
	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 11.0, -- Sesuaikan dengan preferensi Anda

	-- Theme Config (Gruvbox)
	color_scheme = "Gruvbox dark, hard (base16)", -- Atau "Gruvbox light, hard (base16)" untuk tema terang

	-- General Terminal Config
	adjust_window_size_when_changing_font_size = false,
	enable_tab_bar = true,
	window_decorations = "NONE",
	window_background_opacity = 0.9,

	-- Tab
	hide_tab_bar_if_only_one_tab = true,

	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},
}
