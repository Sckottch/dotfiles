return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        priority = 100,
        opts = {},
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            vim.lsp.config("lua_ls", {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        workspace = { checkThirdParty = false },
                    },
                },
            })

            vim.lsp.config("basedpyright", {
                settings = {
                    basedpyright = {
                        analysis = {
                            typeCheckingMode = "basic",  -- em vez do "strict"/"all" padrão
                        },
                    },
                },
            })

            vim.lsp.config("clangd", {
                cmd = {
                    "clangd",
                    "--background-index",
                    "--header-insertion=never",
                    "--completion-style=detailed",
                },
                filetypes = { "c", "cpp" },
                root_markers = { "compile_commands.json", "compile_flags.txt", ".git" },
            })

            vim.lsp.config("*", {
                capabilities = require("blink.cmp").get_lsp_capabilities(),
            })

            vim.lsp.enable({ "lua_ls", "tsgo", "basedpyright", "clangd" })

            vim.diagnostic.config({
                update_in_insert = true,
                virtual_text = true,
                signs = true,
                underline = true,
                severity_sort = true,
            })
        end,
    },
}

