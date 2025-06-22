-- ~/.config/nvim/lua/plugins/treesitter.lua
-- Configuration for nvim-treesitter

return {
  -- Add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "rust",
      },
    },
  },

  -- If you'd rather extend the default config using vim.list_extend
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Add tsx and typescript
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },
}
