vim.g.mapleader = " "

local map = vim.keymap.set

-- Limpa o highlight da busca
map("n", "<Esc>", "<cmd>nohlsearch<cr>")

-- Move linhas selecionadas
map("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move seleção pra baixo" })
map("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move seleção pra cima" })

-- Mantém o cursor centralizado
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "gd", vim.lsp.buf.definition, { desc = "Ir para definição" })

-- Cola sem perder o registro
map("x", "<leader>p", [["_dP]], { desc = "Colar preservando registro" })

-- Clipboard do sistema
map({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank pro clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank linha pro clipboard" })

-- Navegação entre janelas
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-Right>", "<cmd>vertical resize +5<cr>", { desc = "Alargar split" })
map("n", "<C-Left>",  "<cmd>vertical resize -5<cr>", { desc = "Estreitar split" })

-- Desativa o Ex mode
map("n", "Q", "<nop>")

-- Sistema
map("n", "<leader>pv", vim.cmd.Ex)

-- abre a pasta de config no picker
map("n", "<leader>fc", function()
  Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Config files" })

--Bufferline
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Próximo buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<leader>x", "<cmd>bdelete<cr>", { desc = "Fechar buffer" })

--Trilha
map("n", "<leader>d", function()
  local number = vim.fn.input("Exercício: ")
  if not number:match("^%d%d?$") then
    return
  end
  local base = vim.b.netrw_curdir or vim.fn.getcwd()
  local dir = string.format("%s/ex%02d", base, tonumber(number))
  vim.fn.mkdir(dir, "p")
  vim.cmd.edit(vim.fn.fnameescape(dir .. "/relatorio.md"))
end, { desc = "Cria exNN/relatorio.md" })

--Git
map("n", "<leader>gg", function() Snacks.lazygit() end, { desc = "Lazygit" })
