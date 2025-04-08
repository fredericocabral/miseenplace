return {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp" }, -- Ensure cmp-nvim-lsp loads
    config = function()
        local lspconfig = require("lspconfig")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        -- Ensure LSP completion capabilities are fully enabled
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

        -- Setup gopls with proper capabilities
        lspconfig.gopls.setup({
            capabilities = capabilities,
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl"},
            root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
            settings = {
                gopls = {
                    analyses = { 
                        unusedparams = true ,
                        fieldaligment = true,
                    },
                    completeUnimported = true, -- Suggest missing imports
                    usePlaceholders = true,
                    gofumpt = true,
                    staticcheck = true,
                    directoryFilters = { "-vendor" },
                    importShortcut = "both",
                    -- allowModfileModifications = true, -- ✅ Allow gopls to modify `go.mod`
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
        }) -- Make sure this closing bracket is here!

        -- Python LSP
        -- Requirements:
        -- pip install pyright
        -- pip install black ruff
        lspconfig.pyright.setup({
            capabilities = capabilities,
            filetypes = { "python" },
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

        lspconfig.ruff.setup({
            capabilities = capabilities,
            filetypes = { "python" },
        })

        lspconfig.terraformls.setup({
            capabilities = capabilities,
            cmd = { "terraform-ls", "serve" },
            filetypes = { "terraform", "tf", "tfvars" },
            root_dir = lspconfig.util.root_pattern(".terraform", ".git", "*.tf"),
        })

                                                                              
        -- LSP Keymaps
        --vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "gd", function()
            vim.cmd("tab split") -- Open a new tab
            vim.lsp.buf.definition() -- Jump to definition
        end, { noremap = true, silent = true, desc = "Go to Definition in new tab" })

        vim.api.nvim_set_keymap("n", 'gi', "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true, desc = 'Go to implementation'})
        vim.api.nvim_set_keymap("n", "gu", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { noremap = true, silent = true })
    end,
}


