-- ~/.wezterm.lua

local wezterm = require 'wezterm'

return {
  -- Konfigurasi font
  font = wezterm.font 'CaskaydiaCove Nerd Font',
  font_size = 11.0, -- Sesuaikan dengan preferensi Anda

  -- Konfigurasi warna (Gruvbox)
  color_scheme = "Gruvbox dark, hard (base16)", -- Atau "Gruvbox light, hard (base16)" untuk tema terang

  -- Pengaturan umum terminal
  adjust_window_size_when_changing_font_size = false,
  enable_tab_bar = true,
  enable_wayland = true,
  window_background_opacity = 0.5,

  -- Ukuran baris tab
  tab_bar_at_bottom = false,
  use_fancy_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
}