-- ~/.config/nvim/lua/plugins/snacks.lua
-- Configuration for folke/snacks.nvim and its dashboard

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = {
        enabled = true,
        open_on_startup = true,
        preset = {
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
      picker = { enabled = true, keys = {} },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      image = { enabled = true }, -- Based on your health check output
      statuscolumn = { enabled = false }, -- Based on your health check output
    },
  },
}
