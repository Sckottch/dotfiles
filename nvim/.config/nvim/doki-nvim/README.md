# doki-nvim (custom)

Asuna Dark e Hanekawa Tsubasa pro Neovim, com as cores oficiais do Doki Theme
e o mesmo mapeamento de sintaxe da versão JetBrains.

## Instalação (lazy.nvim)

1. Coloque esta pasta em `~/.config/nvim/doki-nvim`.
2. Adicione a spec:

```lua
{
	dir = vim.fn.stdpath("config") .. "/doki-nvim",
	name = "doki-nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.doki_transparent = true -- sem fundo no editor/abas/statusline
		vim.g.doki_cursorline = "bg"  -- "bg" | "underline" | "none"
		vim.cmd.colorscheme("asuna_dark") -- ou "hanekawa_tsubasa"
	end,
},
```

3. Desative o outro tema (`enabled = false`), pra não ter dois temas brigando.

## Trocar de tema na hora

```
:colorscheme asuna_dark
:colorscheme hanekawa_tsubasa
```

## Ajustar uma cor

Paletas em `lua/doki/palettes.lua`, grupos de highlight em `lua/doki/init.lua`.
Pra descobrir o grupo de algo na tela: cursor em cima e `:Inspect`.
