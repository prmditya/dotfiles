-- ~/.config/nvim/lua/plugins/other.lua
-- Configuration for one liner plugins

return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        ["*"] = {
          RGB = true,
          RRGGBB = true,
          names = true,
          rgb_fn = true,
          hsl_fn = true,
          css = true,
          css_fn = true,
        },
      })
    end,
  },
}
