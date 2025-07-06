-- ~/.config/nvim/lua/plugins/mason.lua
-- Configuration for mason.nvim

return {
  -- Add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "flake8",
        "rust-analyzer",
        -- "clangd",
      },
    },
  },
}
