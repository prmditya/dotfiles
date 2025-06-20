-- ~/.config/nvim/lua/plugins/snacks.lua
-- Configuration for folke/snacks.nvim and its dashboard

return {
  {
    "folke/snacks.nvim",
    priority = 1000, -- Ensures it loads early
    lazy = false, -- Ensures it loads at startup
    opts = {
      dashboard = {
        enabled = true,
        open_on_startup = true, -- Optional: to open automatically when Neovim starts without opening files
        preset = {
          -- Using vim.split to properly parse the multi-line string into a table of lines
          -- Note: If the complex block characters still don't display correctly,
          -- it's usually a terminal font rendering issue, not a Neovim config issue.
          -- You might need to adjust your terminal's font or use a simpler ASCII art.
          header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝

D A S H B O A R D
]],
        },
      },
      -- Keep other snacks modules enabled/disabled as they were in your health check,
      -- or explicitly set them here if you want to change their state.
      bigfile = { enabled = true },
      explorer = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      picker = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      image = { enabled = false }, -- Based on your health check output
      statuscolumn = { enabled = false }, -- Based on your health check output
    },
  },
}
