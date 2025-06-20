-- ~/.config/nvim/lua/plugins/trouble.lua
-- Configuration for trouble.nvim

return {
  -- Change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- Disable trouble (Note: This will disable the plugin if this is the last entry for it)
  { "folke/trouble.nvim", enabled = false },
}
