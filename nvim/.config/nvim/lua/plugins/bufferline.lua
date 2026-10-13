return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  opts = {
    options = {
      mode = "buffers",
      separator_style = { "│", "│" },
      show_buffer_close_icons = false,
      show_close_icon = false,
      indicator = { style = "none" },
      always_show_bufferline = true,
    },
    highlights = {
      fill = { bg = "none" },                          -- fundo da barra
      background = { bg = "none" },                     -- abas inativas
      buffer_visible = { bg = "none" },
      buffer_selected = { bg = "none", bold = true },  -- ATIVO mantém fundo
      separator = { fg = "#54546d", bg = "none" },
      separator_selected = { fg = "#54546d", bg = "none" },
      separator_visible = { fg = "#54546d", bg = "none" },
    },
  },
}
