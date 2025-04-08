return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "go",
                "lua",
                "python",
                "javascript",
                "typescript",
                "rust",
                "terraform",
                "hcl",
            }, -- Add languages you use
            highlight = {
                enable = true, -- Enable syntax highlighting
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true }, -- Better indentation
        })
    end,
}
