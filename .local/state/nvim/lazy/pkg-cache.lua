return {pkgs={{file="lazy.lua",source="lazy",spec=function()
return {
  -- nui.nvim can be lazy loaded
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "folke/noice.nvim",
  },
}

end,name="noice.nvim",dir="/home/ditya/.local/share/nvim/lazy/noice.nvim",},{file="community",source="lazy",spec={"nvim-lua/plenary.nvim",lazy=true,},name="plenary.nvim",dir="/home/ditya/.local/share/nvim/lazy/plenary.nvim",},{file="telescope.nvim-scm-1.rockspec",source="rockspec",spec={"telescope.nvim",build=false,specs={{"nvim-lua/plenary.nvim",lazy=true,},},},name="telescope.nvim",dir="/home/ditya/.local/share/nvim/lazy/telescope.nvim",},},version=12,}