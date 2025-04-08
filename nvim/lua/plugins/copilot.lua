return {
    "github/copilot.vim",
    config = function()
        -- Enable Copilot for all file types
        vim.g.copilot_enabled = 1

        -- Keybindings
        vim.keymap.set("i", "<C-j>", "copilot#Accept('<CR>')", { expr = true, silent = true })
        vim.keymap.set("i", "<C-k>", "<Plug>(copilot-next)", { silent = true })
        vim.keymap.set("i", "<C-h>", "<Plug>(copilot-previous)", { silent = true })
        vim.keymap.set("i", "<C-l>", "<Plug>(copilot-dismiss)", { silent = true })
    end,
}
