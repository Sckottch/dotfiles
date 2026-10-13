return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kanagawa").setup({
            compile = false,
            transparent = true,
            commentStyle = { italic = true },
            keywordStyle = { italic = true },
            theme = "dragon",
            background = {
                dark = "dragon",
                light = "lotus",
            },
        })
        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "kanagawa",
            callback = function()
                local groups = { "LineNr", "CursorLineNr", "SignColumn", "EndOfBuffer" }
                for _, group in ipairs(groups) do
                    vim.api.nvim_set_hl(0, group, { bg = "none" })
                end
                vim.api.nvim_set_hl(0, "LineNr", { fg = "#4a4744" })
                vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#c5c9c5", bold = true })
                vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#181616" })
                vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2a2a37" })
                vim.api.nvim_set_hl(0, "Visual", { bg = "#333340" })
                vim.api.nvim_set_hl(0, "StatusLine", { bg = "#2a2a37", fg = "#c5c9c5" })
                vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "#1a1a22", fg = "#727169" })
                vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
                vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
                local bufferline_groups = {
                    "BufferLineFill",              -- o fundo da barra inteira
                    "BufferLineBackground",        -- abas inativas
                    "BufferLineBufferSelected",    -- aba ativa
                    "BufferLineBufferVisible",     -- aba visível mas não focada
                }
                for _, group in ipairs(bufferline_groups) do
                    vim.api.nvim_set_hl(0, group, { bg = "none" })
                end
            end,
        })
    end,
}
