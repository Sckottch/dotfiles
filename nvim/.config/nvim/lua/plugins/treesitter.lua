return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  version = false,
  build = ":TSUpdate",
  config = function()
    local TS = require("nvim-treesitter")
    TS.setup()

    local parsers = {
      "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
      "c_sharp", "c", "cpp", "make",
      "javascript", "typescript", "tsx", "jsdoc",
      "json", "html", "css",
    }

    local installed = TS.get_installed()
    local missing = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, parsers)

    if #missing > 0 then
      TS.install(missing)
    end

    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(ft)
        if not lang then return end

        if not pcall(vim.treesitter.start, args.buf, lang) then return end

        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
