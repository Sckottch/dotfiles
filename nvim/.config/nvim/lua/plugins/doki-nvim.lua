return {
	dir = vim.fn.stdpath("config") .. "/doki-nvim",
	name = "doki-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.doki_transparent = true -- sem fundo no editor/abas/statusline
		vim.g.doki_cursorline = "bg"  -- "bg" | "underline" | "none"
	end,
}
