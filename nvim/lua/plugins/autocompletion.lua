return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",     -- LSP completion
        "hrsh7th/cmp-buffer",       -- Buffer completion
        "hrsh7th/cmp-path",         -- Path completion
        "hrsh7th/cmp-cmdline",      -- Command-line completion
        "hrsh7th/cmp-nvim-lua",     -- Lua API completion
    },
    config = function()
        local cmp = require("cmp")

        cmp.setup({
            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item(), -- Navigate down
                ["<C-p>"] = cmp.mapping.select_prev_item(), -- Navigate up
                ["<C-y>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection
                ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }), -- Confirm with Enter

            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- LSP-based completion
                { name = "buffer" },   -- Text from the current buffer
                { name = "path" },     -- Path completion
            }),
        })
    end,
}
