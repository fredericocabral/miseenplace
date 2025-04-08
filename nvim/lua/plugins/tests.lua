return {
    "vim-test/vim-test",
    config = function()
        -- Use `:TestNearest`, `:TestFile`, `:TestSuite`, etc.
        --vim.g["test#strategy"] = "neovim" -- Run tests inside Neovim terminal
        vim.g["test#strategy"] = "basic" -- Run tests inside Neovim terminal
        vim.g["test#preserve_screen"] = 0 -- Keep test output visible

        -- Keybindings
        vim.keymap.set("n", "<leader>t", ":TestFile<CR>", { noremap = true, silent = true }) -- Run all tests in file
        vim.keymap.set("n", "<leader>T", ":TestNearest<CR>", { noremap = true, silent = true }) -- Run nearest test
        -- vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>", { noremap = true, silent = true }) -- Run full test suite
        vim.keymap.set("n", "<leader>l", ":TestLast<CR>", { noremap = true, silent = true }) -- Rerun last test
        --vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>", { noremap = true, silent = true }) -- Open last test file
    end,
}

-- return {
--     "nvim-neotest/neotest",
--     dependencies = {
--         "nvim-neotest/nvim-nio",
--         "nvim-lua/plenary.nvim",
--         "nvim-treesitter/nvim-treesitter",
--         "antoinemadec/FixCursorHold.nvim",
--         "nvim-neotest/neotest-go",       -- Go support
--         "nvim-neotest/neotest-python",   -- Python support
--         "nvim-neotest/neotest-plenary",  -- Lua support
--         "nvim-neotest/neotest-jest",     -- JavaScript/TypeScript support
--         "rouge8/neotest-rust",           -- Rust support
--     },
--     config = function()
--         local neotest = require("neotest")
-- 
--         neotest.setup({
--             adapters = {
--                 require("neotest-go"),
--                 require("neotest-python")({
--                     dap = { justMyCode = false }, -- Debugging support
--                     runner = "pytest",
--                 }),
--                 require("neotest-plenary"),
--                 require("neotest-jest"),
--                 require("neotest-rust"),
--             },
-- 
--             -- output = { enabled = true, open_on_run = "short" }, -- Show error output
--             output = { enabled = true, open_on_run = "always" }, -- Show error output
--             quickfix = { open = false }, -- Don't auto-open quickfix
--             status = { virtual_text = true }, -- Show error messages inline
--         })
-- 
--         -- Keybindings
--         --vim.keymap.set("n", "<leader>t", function()
--         --    neotest.run.run()
--         --end, { noremap = true, silent = true, desc = "Run nearest test" })
-- 
-- 
--         --vim.keymap.set("n", "<leader>l", function()
--         --    neotest.run.run_last()
--         --end, { noremap = true, silent = true, desc = "Run last test" })
-- 
--         --vim.keymap.set("n", "<leader>T", function()
--         --    neotest.run.run(vim.fn.expand("%"))
--         --end, { noremap = true, silent = true, desc = "Run file tests" })
-- 
--         --vim.keymap.set("n", "<leader>x", function()
--         --    neotest.summary.toggle()
--         --end, { noremap = true, silent = true, desc = "Toggle test summary" })
-- 
--         --vim.keymap.set("n", "<leader>te", function()
--         --    neotest.output.open({ enter = true })
--         --end, { noremap = true, silent = true, desc = "Show last test error output" })
-- 
--         --        -- Keybinding to manually open the output panel
--         --vim.keymap.set("n", "<leader>to", function()
--         --    neotest.output_panel.open({ enter = true })
--         --end, { noremap = true, silent = true, desc = "Open test output panel" })
-- 
-- 
--     end,
-- }
