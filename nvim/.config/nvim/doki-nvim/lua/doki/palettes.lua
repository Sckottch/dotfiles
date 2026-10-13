-- Cores tiradas das definições oficiais do Doki Theme (doki-master-theme)
-- e mapeadas como no esquema "Doki Dark" da versão JetBrains.

local shared = {
	fg = "#F8F8F2", -- texto do editor (foregroundColorEditor)
	constant = "#86dbfd",
	error = "#ff5555",
	warn = "#EFA554",
	green = "#42E66C",
	cyan = "#75D7EC",
	red = "#E356A7",
	yellow = "#EFA554",
	blue = "#9B6BDF",
	magenta = "#E64747",
}

local function with_shared(p)
	return setmetatable(p, { __index = shared })
end

local M = {}

M.asuna_dark = with_shared({
	bg = "#1b1b1b",
	bg_alt = "#1c1c1c",
	bg_float = "#302c2f",
	cursorline = "#272727",
	line_nr = "#5d5051",
	fg_ui = "#bbbbbb",
	comment = "#5C6276",
	keyword = "#e0474b",
	string = "#FFD86E",
	func = "#579DFA",
	func_decl = "#7ECAFA",
	type = "#7ECAFA",
	key = "#FCA57E",
	operator = "#FF6363",
	accent = "#99202c",
	accent_bright = "#b62230",
	selection = "#531616",
	selection_fg = "#fbfbfb",
	search_bg = "#A8A117",
	search_fg = "#0e0505",
	border = "#2a2929",
	dim = "#4a4a4a",
	highlight = "#282828",
	ref_highlight = "#313131",
	folded = "#212121",
	diff_add = "#1B3B1C",
	diff_delete = "#323234",
	diff_change = "#203952",
	diff_conflict = "#581F1F",
})

M.hanekawa_tsubasa = with_shared({
	bg = "#100d11",
	bg_alt = "#1b1820",
	bg_float = "#1b1820",
	cursorline = "#1e1d1f",
	line_nr = "#777495",
	fg_ui = "#c3c3c3",
	comment = "#79769f",
	keyword = "#d55fde",
	string = "#F6E3CC",
	func = "#9a97f4",
	func_decl = "#e39656",
	type = "#e39656",
	key = "#7ceec8",
	operator = "#ff8fec",
	accent = "#634F8D",
	accent_bright = "#8968dc",
	selection = "#5a3b5d",
	selection_fg = "#ebd6fc",
	search_bg = "#305D49",
	search_fg = "#ebd6fc",
	border = "#211c23",
	dim = "#494949",
	highlight = "#262129",
	ref_highlight = "#262626",
	folded = "#322932",
	diff_add = "#142F14",
	diff_delete = "#1D1D1D",
	diff_change = "#152A3D",
	diff_conflict = "#36151F",
})

return M
