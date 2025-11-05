return {
    "preservim/nerdtree",
    config = function()
        -- Keybinding to toggle NERDTree
        vim.keymap.set("n", "<C-n>", ":NERDTreeToggle<CR>", { noremap = true, silent = true })

        -- Ignore folders and files
        vim.g.NERDTreeIgnore = { "__pycache__", "\\.pyc$", "\\.pyo$", "\\.pytest_cache" }


        -- Open file in a new tab when pressing enter
        vim.cmd([[
        autocmd FileType nerdtree map <buffer> <CR> t
        ]])
    end,
}



-- return {
--     "nvim-tree/nvim-tree.lua",
--     dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional: Icons for files
--     config = function()
--         require("nvim-tree").setup({
--             view = {
--                 width = 30, -- Sidebar width
--                 side = "left", -- Show tree on the left side
--                 number = false, -- No line numbers
--                 relativenumber = false, -- No relative line numbers
--             },
--             git = { enable = true }, -- Show git status
--             renderer = {
--                 icons = {
--                     glyphs = {
--                         default = "📄",
--                         folder = { default = "📂", open = "📂" },
--                     },
--                 },
--             },
--             actions = {
--                 open_file = {
--                     window_picker = {
--                         enable = false
--                     }
--                 }
--             },
--             filters = { dotfiles = false }, -- Show dotfiles
--             update_focused_file = { enable = true },
--         })
-- 
--         -- Keybindings
--         --vim.api.nvim_set_keymap("n", "<C-n>n", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
--         vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
-- 
--         --vim.api.nvim_set_keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", { noremap = true, silent = true })
--     end,
-- }
