local M = {}
-- Mistura duas cores hex. amount = 0 -> só "base", 1 -> só "color".
local function blend(color, base, amount)
	local function channel(hex, i)
		return tonumber(hex:sub(i, i + 1), 16)
	end
	local out = "#"
	for _, i in ipairs({ 2, 4, 6 }) do
		local v = channel(base, i) + (channel(color, i) - channel(base, i)) * amount
		out = out .. string.format("%02x", math.floor(v + 0.5))
	end
	return out
end

-- Opções (defina antes de chamar :colorscheme):
--   vim.g.doki_transparent = true         -> sem fundo no editor, abas e statusline
--   vim.g.doki_cursorline  = "bg"         -> linha do cursor com fundo (padrão)
--                          = "underline"  -> só sublinhado
--                          = "none"       -> só o número da linha destacado

local function groups(c, opts)
	local bg = opts.transparent and "NONE" or c.bg
	local bar = opts.transparent and "NONE" or c.bg_alt

	local cursorline = { bg = blend(c.accent, c.bg, opts.blend) }
    if opts.cursorline == "underline" then
		cursorline = { underline = true, sp = c.dim }
	elseif opts.cursorline == "none" then
		cursorline = {}
	end

	return {
		-- Editor
		Normal = { fg = c.fg, bg = bg },
		NormalNC = { fg = c.fg, bg = bg },
		NormalFloat = { fg = c.fg_ui, bg = c.bg_float },
		FloatBorder = { fg = c.accent_bright, bg = c.bg_float },
		FloatTitle = { fg = c.accent_bright, bg = c.bg_float, bold = true },
		SignColumn = { bg = bg },
		FoldColumn = { fg = c.dim, bg = bg },
		EndOfBuffer = { fg = c.dim, bg = bg },
		LineNr = { fg = c.line_nr },
		CursorLineNr = { fg = c.accent_bright, bold = true },
		CursorLine = cursorline,
		CursorColumn = { bg = c.cursorline },
		ColorColumn = { bg = c.highlight },
		VirtColumn = { fg = c.border },
		Cursor = { fg = c.bg, bg = c.fg },
		Visual = { bg = c.selection, fg = c.selection_fg },
		VisualNOS = { bg = c.selection },
		Search = { fg = c.search_fg, bg = c.search_bg },
		IncSearch = { fg = c.selection_fg, bg = c.accent_bright },
		CurSearch = { fg = c.selection_fg, bg = c.accent_bright },
		Substitute = { fg = c.selection_fg, bg = c.accent },
		MatchParen = { fg = c.accent_bright, bold = true, underline = true },
		NonText = { fg = c.dim },
		Whitespace = { fg = c.dim },
		SpecialKey = { fg = c.dim },
		Folded = { fg = c.comment, bg = c.folded },
		WinSeparator = { fg = c.border },
		VertSplit = { fg = c.border },
		StatusLine = { fg = c.fg_ui, bg = bar },
		StatusLineNC = { fg = c.line_nr, bg = bar },
		TabLine = { fg = c.line_nr, bg = bar },
		TabLineFill = { bg = bar },
		TabLineSel = { fg = c.fg, bg = bg, bold = true },
		WinBar = { fg = c.fg_ui, bg = bg },
		WinBarNC = { fg = c.line_nr, bg = bg },
		Pmenu = { fg = c.fg_ui, bg = c.bg_float },
		PmenuSel = { fg = c.selection_fg, bg = c.accent },
		PmenuSbar = { bg = c.bg_alt },
		PmenuThumb = { bg = c.accent },
		PmenuMatch = { fg = c.accent_bright, bold = true },
		PmenuMatchSel = { fg = c.selection_fg, bold = true },
		Directory = { fg = c.type },
		Title = { fg = c.keyword, bold = true },
		Question = { fg = c.key },
		MoreMsg = { fg = c.key },
		ModeMsg = { fg = c.fg_ui, bold = true },
		ErrorMsg = { fg = c.error },
		WarningMsg = { fg = c.warn },
		QuickFixLine = { bg = c.cursorline, bold = true },
		SpellBad = { undercurl = true, sp = c.error },
		SpellCap = { undercurl = true, sp = c.warn },

		-- Sintaxe (mesmo mapeamento do Doki na JetBrains)
		Comment = { fg = c.comment, italic = true },
		Constant = { fg = c.constant, italic = true },
		String = { fg = c.string },
		Character = { fg = c.string },
		Number = { fg = c.constant },
		Float = { fg = c.constant },
		Boolean = { fg = c.keyword },
		Identifier = { fg = c.fg },
		Function = { fg = c.func },
		Statement = { fg = c.keyword },
		Conditional = { fg = c.keyword },
		Repeat = { fg = c.keyword },
		Label = { fg = c.keyword },
		Keyword = { fg = c.keyword },
		Exception = { fg = c.keyword },
		Operator = { fg = c.operator },
		PreProc = { fg = c.keyword },
		Include = { fg = c.keyword },
		Define = { fg = c.keyword },
		Macro = { fg = c.string, bold = true },
		PreCondit = { fg = c.keyword },
		Type = { fg = c.type },
		StorageClass = { fg = c.keyword },
		Structure = { fg = c.type },
		Typedef = { fg = c.key, italic = true },
		Special = { fg = c.key },
		SpecialChar = { fg = c.string },
		Delimiter = { fg = c.fg },
		Underlined = { underline = true },
		Error = { fg = c.error },
		Todo = { fg = c.key, bold = true },

		-- Treesitter
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.constant, italic = true },
		["@variable.parameter"] = { fg = c.string, italic = true },
		["@variable.member"] = { fg = c.fg },
		["@property"] = { fg = c.fg },
		["@constant"] = { fg = c.constant, italic = true },
		["@constant.builtin"] = { fg = c.keyword },
		["@constant.macro"] = { fg = c.string, bold = true },
		["@module"] = { fg = c.key },
		["@string"] = { link = "String" },
		["@string.escape"] = { fg = c.string, bold = true },
		["@character"] = { link = "Character" },
		["@number"] = { link = "Number" },
		["@boolean"] = { link = "Boolean" },
		["@type"] = { fg = c.type },
		["@type.builtin"] = { fg = c.keyword },
		["@type.definition"] = { fg = c.key, italic = true },
		["@attribute"] = { fg = c.func, italic = true },
		["@function"] = { fg = c.func_decl },
		["@function.call"] = { fg = c.func },
		["@function.builtin"] = { fg = c.func },
		["@function.macro"] = { fg = c.string, bold = true },
		["@function.method"] = { fg = c.func_decl },
		["@function.method.call"] = { fg = c.func },
		["@constructor"] = { fg = c.type },
		["@operator"] = { fg = c.operator },
		["@keyword"] = { fg = c.keyword },
		["@keyword.directive"] = { fg = c.keyword },
		["@keyword.import"] = { fg = c.keyword },
		["@punctuation.delimiter"] = { fg = c.operator },
		["@punctuation.bracket"] = { fg = c.fg },
		["@punctuation.special"] = { fg = c.operator },
		["@comment"] = { link = "Comment" },
		["@markup.heading"] = { fg = c.keyword, bold = true },
		["@markup.link"] = { fg = c.func, underline = true },
		["@markup.raw"] = { fg = c.string },
		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@tag"] = { fg = c.operator },
		["@tag.attribute"] = { fg = c.key },

		-- Semantic tokens (clangd)
		["@lsp.type.class"] = { fg = c.type },
		["@lsp.type.struct"] = { fg = c.type },
		["@lsp.type.enum"] = { fg = c.type },
		["@lsp.type.enumMember"] = { fg = c.constant, italic = true },
		["@lsp.type.type"] = { fg = c.type },
		["@lsp.type.typeParameter"] = { fg = c.key, italic = true },
		["@lsp.type.concept"] = { fg = c.key, italic = true },
		["@lsp.type.namespace"] = { fg = c.key },
		["@lsp.type.function"] = { fg = c.func },
		["@lsp.type.method"] = { fg = c.func },
		["@lsp.type.macro"] = { fg = c.string, bold = true },
		["@lsp.type.parameter"] = { fg = c.string, italic = true },
		["@lsp.type.variable"] = { fg = c.fg },
		["@lsp.type.property"] = { fg = c.fg },
		["@lsp.type.operator"] = { fg = c.operator },
		["@lsp.typemod.function.declaration"] = { fg = c.func_decl },
		["@lsp.typemod.method.declaration"] = { fg = c.func_decl },
		["@lsp.typemod.variable.readonly"] = { fg = c.constant, italic = true },
		["@lsp.typemod.variable.static"] = { fg = c.fg, italic = true },
		["@lsp.typemod.property.static"] = { fg = c.fg, italic = true },

		-- LSP
		LspReferenceText = { bg = c.ref_highlight },
		LspReferenceRead = { bg = c.ref_highlight },
		LspReferenceWrite = { bg = c.ref_highlight, underline = true },
		LspInlayHint = { fg = c.dim, italic = true },
		LspSignatureActiveParameter = { fg = c.accent_bright, bold = true },

		-- Diagnósticos
		DiagnosticError = { fg = c.error },
		DiagnosticWarn = { fg = c.warn },
		DiagnosticInfo = { fg = c.type },
		DiagnosticHint = { fg = c.key },
		DiagnosticOk = { fg = c.green },
		DiagnosticUnderlineError = { undercurl = true, sp = c.error },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.warn },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.type },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.key },
		DiagnosticVirtualTextError = { fg = c.error, italic = true },
		DiagnosticVirtualTextWarn = { fg = c.warn, italic = true },
		DiagnosticVirtualTextInfo = { fg = c.type, italic = true },
		DiagnosticVirtualTextHint = { fg = c.key, italic = true },
		DiagnosticUnnecessary = { fg = c.comment },

		-- Diff / git
		DiffAdd = { bg = c.diff_add },
		DiffDelete = { bg = c.diff_delete },
		DiffChange = { bg = c.diff_change },
		DiffText = { bg = c.diff_change, bold = true },
		Added = { fg = c.green },
		Changed = { fg = c.type },
		Removed = { fg = c.error },
		GitSignsAdd = { fg = c.green },
		GitSignsChange = { fg = c.type },
		GitSignsDelete = { fg = c.error },

		-- blink.cmp
		BlinkCmpMenu = { link = "Pmenu" },
		BlinkCmpMenuBorder = { link = "FloatBorder" },
		BlinkCmpMenuSelection = { link = "PmenuSel" },
		BlinkCmpLabelMatch = { fg = c.accent_bright, bold = true },
		BlinkCmpKind = { fg = c.key },
		BlinkCmpDoc = { link = "NormalFloat" },
		BlinkCmpDocBorder = { link = "FloatBorder" },
	}
end

local function terminal(c)
	local colors = {
		c.bg_alt, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg_ui,
		c.dim, c.red, c.green, c.yellow, c.blue, c.magenta, c.cyan, c.fg,
	}
	for i, color in ipairs(colors) do
		vim.g["terminal_color_" .. (i - 1)] = color
	end
end

function M.load(name)
	local c = require("doki.palettes")[name]
	local opts = {
		transparent = vim.g.doki_transparent == true,
		blend = vim.g.doki_cursorline_blend or 0.15,
    }

	if vim.g.colors_name then
		vim.cmd("highlight clear")
	end
	vim.o.termguicolors = true
	vim.o.background = "dark"
	vim.g.colors_name = name

	for group, spec in pairs(groups(c, opts)) do
		vim.api.nvim_set_hl(0, group, spec)
	end
	terminal(c)
end

return M
