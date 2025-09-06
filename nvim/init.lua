vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true -- Enable cursor line highlighting


vim.cmd("syntax on")   -- Enable default syntax highlighting
vim.cmd("filetype plugin indent on")  -- Ensure proper filetype support



vim.opt.clipboard = "unnamedplus" -- Use system clipboard for all copy/paste


-- Highlight the column limit for Go and Python
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "go" },
    callback = function()
        vim.opt.colorcolumn = "100"
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "python" },
    callback = function()
        vim.opt.colorcolumn = "79"
    end,
})

-- Automatically resize the window when opening a file for small monitors
vim.api.nvim_create_autocmd("WinEnter", {
  callback = function()
    local filetype = vim.bo.filetype
    local width = vim.api.nvim_win_get_width(0)
    local target_width = nil

    if filetype == "python" then
      target_width = 80
    elseif filetype == "go" then
      target_width = 100
    end

    if target_width and width < target_width then
      vim.cmd("vertical resize " .. target_width)
    end
  end,
})


local last_test_cmd = nil

local function run_go_test_for_current_package()
    local file = vim.fn.expand("%:p") -- Get full path of the current file
    local dir = vim.fn.fnamemodify(file, ":h") -- Get package directory (without file)
    
    if vim.bo.filetype == "go" then
        -- Go: Force colored output
        cmd = "cd " .. dir .. " && go test ./..."
    elseif vim.bo.filetype == "python" then
        -- Python: Force colored output using `--color=yes`
        cmd = "cd " .. dir .. " && env TERM=xterm-256color pytest " .. file
    else
        print("No test command configured for " .. vim.bo.filetype)
        return
    end

    last_test_cmd = cmd

        -- Use :terminal instead of :! to keep colors
    --vim.cmd("!term " .. cmd)
    vim.cmd("!" .. cmd) -- Execute in shell
end

-- Function to rerun the last test command
local function rerun_last_test()
    if last_test_cmd then
        --vim.cmd("!term " .. last_test_cmd)
        vim.cmd("!" .. last_test_cmd)
    else
        print("No test has been run yet")
    end
end

-- Keybinding to run tests for the current package
-- vim.keymap.set("n", "<leader>t", run_go_test_for_current_package, { noremap = true, silent = true})
-- vim.keymap.set("n", "<leader>l", rerun_last_test, { noremap = true, silent = true})


-- Faster CursorHold so floats feel responsive
vim.o.updatetime = 500  -- tweak to taste

-- Nice diagnostic float defaults
vim.diagnostic.config({
  update_in_insert = false,
  severity_sort = true,
  float = { border = "rounded", source = "if_many", focusable = false },
})

-- On idle, show a diagnostic float for WARN/ERROR on the current line
vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    local bufnr = 0
    local lnum = vim.api.nvim_win_get_cursor(0)[1] - 1
    local diags = vim.diagnostic.get(bufnr, {
      lnum = lnum,
      severity = { min = vim.diagnostic.severity.WARN }, -- only Warn/Error
    })
    if #diags == 0 then return end
    vim.diagnostic.open_float(bufnr, {
      scope = "line",
      focus = false,
      close_events = { "CursorMoved", "BufHidden", "InsertCharPre" },
    })
  end,
})



require("config.lazy")
require("config.alternate")
