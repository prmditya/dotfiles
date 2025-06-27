-- ~/.config/nvim/lua/plugins/colorscheme.lua
-- Load pywal colorscheme dynamically, fallback to gruvbox

return {

  {
    "ellisonleao/gruvbox.nvim",
    opts = { transparent_mode = true },
  },

  {
    "RedsXDD/neopywal.nvim",
    name = "neopywal",
    lazy = true,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },

  -- Config to load the selected colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "neopywal-dark",
    },
  },
}
