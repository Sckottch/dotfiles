local opt = vim.opt

-- Interface
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.scrolloff = 8
opt.termguicolors = true
opt.isfname:append("@-@")

-- Indentação
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.smartindent = true
opt.colorcolumn = "100"
-- Busca
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Undo persistente
opt.swapfile = false
opt.backup = false
opt.undofile = true

-- Comportamento
opt.splitright = true
opt.splitbelow = true
opt.updatetime = 50
opt.confirm = true
opt.wrap = false

-- Folds (treesitter)
opt.foldmethod = "expr"
opt.foldlevel = 99
