-- O nvim-surround mapeia `ds` globalmente, então o `d` do netrw (criar pasta)
-- esperava o timeoutlen inteiro antes de executar. `nowait` elimina essa espera.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local mkdir = vim.fn.maparg("d", "n", false, true)
    if mkdir.buffer == 1 then
      mkdir.nowait = 1
      vim.fn.mapset("n", false, mkdir)
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})
