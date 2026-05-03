return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Ensure cmp-nvim-lsp loads
    config = function()
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Ensure LSP completion capabilities are fully enabled
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        -- gopls
        vim.lsp.config("gopls", {
            capabilities = capabilities,
            settings = {
                gopls = {
                    analyses = {
                        unusedparams = true,
                        fieldaligment = true,
                    },
                    completeUnimported = true, -- Suggest missing imports
                    usePlaceholders = true,
                    gofumpt = true,
                    staticcheck = true,
                    directoryFilters = { "-vendor" },
                    importShortcut = "both",
                    -- allowModfileModifications = true, -- Allow gopls to modify `go.mod`
                    hints = {
                        assignVariableTypes = true,
                        compositeLiteralFields = true,
                        compositeLiteralTypes = true,
                        functionTypeParameters = true,
                        parameterNames = true,
                        rangeVariableTypes = true,
                    },
                },
            },
        })
        vim.lsp.enable("gopls")

        -- Python LSP
        -- Requirements:
        -- pip install pyright
        -- pip install black ruff
        vim.lsp.config("pyright", {
            capabilities = capabilities,
            settings = {
                python = {
                    analysis = {
                        typeCheckingMode = "basic", -- Options: "off", "basic", "strict"
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "workspace", -- "openFilesOnly" for performance
                    },
                },
            },
        })
        vim.lsp.enable("pyright")

        vim.lsp.config("ruff", {
            capabilities = capabilities,
        })
        vim.lsp.enable("ruff")

        vim.lsp.config("terraformls", {
            capabilities = capabilities,
        })
        vim.lsp.enable("terraformls")

        -- LSP Keymaps
        vim.keymap.set("n", "gd", function()
            vim.cmd("tab split") -- Open a new tab
            vim.lsp.buf.definition() -- Jump to definition
        end, { noremap = true, silent = true, desc = "Go to Definition in new tab" })

        vim.api.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true, desc = "Go to implementation" })
        vim.api.nvim_set_keymap("n", "gu", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })

        -- Ensure K shows docs from the active LSP
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf, noremap = true, silent = true, desc = "LSP Hover" }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            end,
        })
    end,
}
