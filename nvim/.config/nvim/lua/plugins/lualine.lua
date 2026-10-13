-- lua/plugins/lualine.lua
return {
  "nvim-lualine/lualine.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "auto",
      globalstatus = true,      -- uma barra só, não uma por split
      section_separators = { left = "", right = "" },
      component_separators = { left = "│", right = "│" },
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },  -- path=1 mostra caminho relativo
    },
  },
}
