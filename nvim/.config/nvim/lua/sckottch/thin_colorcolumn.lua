-- Régua fina: desenha "│" na coluna definida por 'colorcolumn'.
-- Segue a option nativa (global, por janela ou por filetype) e some
-- nas linhas que já passam do limite, pra não cobrir o texto.

local ns = vim.api.nvim_create_namespace("thin_colorcolumn")
local char = "│"
local state = {}

local function display_width(line, tabstop)
	local width = 0
	for ch in line:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
		if ch == "\t" then
			width = width + tabstop - (width % tabstop)
		else
			width = width + vim.api.nvim_strwidth(ch)
		end
	end
	return width
end

local function parse(cc, textwidth)
	local cols = {}
	for item in cc:gmatch("[^,]+") do
		local n = tonumber(item)
		if item:match("^[+-]") and textwidth > 0 then
			n = textwidth + tonumber(item)
		end
		if n and n > 0 then
			table.insert(cols, n)
		end
	end
	return cols
end

vim.api.nvim_set_decoration_provider(ns, {
	on_win = function(_, win, buf)
		local cols = parse(vim.wo[win].colorcolumn, vim.bo[buf].textwidth)
		if #cols == 0 then
			state[win] = nil
			return false
		end
		local leftcol = vim.api.nvim_win_call(win, vim.fn.winsaveview).leftcol
		state[win] = { cols = cols, leftcol = leftcol, tabstop = vim.bo[buf].tabstop }
	end,
	on_line = function(_, win, buf, row)
		local s = state[win]
		if not s then
			return
		end
		local line = vim.api.nvim_buf_get_lines(buf, row, row + 1, false)[1] or ""
		local width = display_width(line, s.tabstop)
		for _, col in ipairs(s.cols) do
			local win_col = col - 1 - s.leftcol
			if width < col and win_col >= 0 then
				vim.api.nvim_buf_set_extmark(buf, ns, row, 0, {
					virt_text = { { char, "VirtColumn" } },
					virt_text_win_col = win_col,
					hl_mode = "combine",
					ephemeral = true,
				})
			end
		end
	end,
})

-- Esconde o bloco grosso nativo e dá cor à linha fina.
-- Roda de novo a cada troca de tema, senão o tema sobrescreve.
local function apply_hl()
	vim.api.nvim_set_hl(0, "ColorColumn", {})
	if vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = "VirtColumn" })) then
		vim.api.nvim_set_hl(0, "VirtColumn", { link = "NonText" })
	end
end

apply_hl()
vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_hl })
