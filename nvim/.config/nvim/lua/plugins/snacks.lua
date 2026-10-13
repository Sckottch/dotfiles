return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
  },
  keys = {
    { "<C-p>", function() Snacks.picker.files() end,     desc = "Find files" },
    { "<leader>fg", function() Snacks.picker.grep() end,      desc = "Grep" },
    { "<leader>fb", function() Snacks.picker.buffers() end,   desc = "Buffers" },
    { "<leader>fr", function() Snacks.picker.recent() end,    desc = "Recent files" },
    { "<leader>fh", function() Snacks.picker.help() end,      desc = "Help tags" },
    { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Grep word", mode = { "n", "x" } },
    { "<leader>fp", function() Snacks.picker() end,           desc = "All pickers" },
  },
}
