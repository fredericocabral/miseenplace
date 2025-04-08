return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" }, -- Required dependency
    config = function()
        local telescope = require("telescope")
        local actions = require("telescope.actions") -- ✅ Fix: Ensure actions is required


        telescope.setup({
            defaults = {
                file_ignore_patterns = { "node_modules/", ".git", "vendor/" }, -- Ignore these folders
                layout_strategy = "horizontal",
                layout_config = { preview_width = 0.5 },

                
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next, -- Move down
                        ["<C-k>"] = actions.move_selection_previous, -- Move up
                        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Send to Quickfix
                    },
                },
            },
        })

        -- Keybindings
        vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    end,
}
