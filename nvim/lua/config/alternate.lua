-- Function to switch between Go production and test files
local function toggle_test_file()
    local current_file = vim.fn.expand("%:p") -- Get full path of the current file

    if not current_file:match("%.go$") then
        print("Not a Go file!")
        return
    end

    local target_file
    if current_file:match("_test%.go$") then
        -- If we are in a test file, switch to the production file
        target_file = current_file:gsub("_test%.go$", ".go")
    else
        -- If we are in a production file, switch to the test file
        target_file = current_file:gsub("%.go$", "_test.go")
    end

    if vim.fn.filereadable(target_file) == 1 then
        vim.cmd("vsplit " .. vim.fn.fnameescape(target_file)) -- Open file in vertical split
    else
        print("File not found: " .. target_file)
    end
end

-- Keybinding to toggle between production and test file
vim.keymap.set("n", "<leader>a", toggle_test_file, { noremap = true, silent = true })
