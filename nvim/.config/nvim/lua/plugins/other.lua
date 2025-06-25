-- ~/.config/nvim/lua/plugins/other.lua
-- Configuration for one liner plugins

return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        css = { rgb_fn = true },
      })
    end,
  },
}
