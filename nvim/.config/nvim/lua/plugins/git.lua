-- lua/plugins/git.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(buffer)
        local gs = require("gitsigns")
        vim.keymap.set("n", "]h", gs.next_hunk, { buffer = buffer, desc = "Próximo hunk" })
        vim.keymap.set("n", "[h", gs.prev_hunk, { buffer = buffer, desc = "Hunk anterior" })
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, { buffer = buffer, desc = "Stage hunk" })
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, { buffer = buffer, desc = "Reset hunk" })
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, { buffer = buffer, desc = "Preview hunk" })
      end,
    },
  },
}
