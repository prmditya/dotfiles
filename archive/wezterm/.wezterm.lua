local wezterm = require("wezterm")

-- === Pywal Integration ===
local wal = {}
local colors_path = os.getenv("HOME") .. "/.cache/wal/colors.json"

local function file_exists(name)
	local f = io.open(name, "r")
	if f then
		f:close()
		return true
	end
	return false
end

if file_exists(colors_path) then
	local file = io.open(colors_path, "r")
	local content = file:read("*a")
	file:close()

	local data = wezterm.json_parse(content)

	wal = {
		foreground = data.special.foreground,
		background = data.special.background,
		cursor_bg = data.special.cursor,
		cursor_fg = data.special.background,
		selection_bg = data.colors.color2,
		selection_fg = data.special.background,
		ansi = {
			data.colors.color0,
			data.colors.color1,
			data.colors.color2,
			data.colors.color3,
			data.colors.color4,
			data.colors.color5,
			data.colors.color6,
			data.colors.color7,
		},
		brights = {
			data.colors.color8,
			data.colors.color9,
			data.colors.color10,
			data.colors.color11,
			data.colors.color12,
			data.colors.color13,
			data.colors.color14,
			data.colors.color15,
		},
	}
end

-- === WezTerm Config ===
return {
	-- Font Config
	font = wezterm.font("CaskaydiaCove Nerd Font"),
	font_size = 12.0,

	-- General Terminal Config
	adjust_window_size_when_changing_font_size = false,
	enable_tab_bar = true,
	hide_tab_bar_if_only_one_tab = true,
	enable_wayland = false,
	window_decorations = "NONE",
	window_background_opacity = 0.7,

	-- Window Padding
	window_padding = {
		left = 10,
		right = 10,
		top = 10,
		bottom = 0,
	},

	-- Theme (uses Pywal if available)
	colors = next(wal) ~= nil and wal or nil,
	color_scheme = next(wal) == nil and "Gruvbox Material (Gogh)" or nil,
}
