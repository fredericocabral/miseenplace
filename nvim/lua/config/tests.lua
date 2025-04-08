local function run_tests()
    local file = vim.fn.expand("%:p") -- Get the full path of the current file
    local filetype = vim.bo.filetype   -- Detect file type (language)
    local cmd = nil                    -- Placeholder for the test command

    if filetype == "go" then
        -- Run `go test` for the current package
        cmd = "go test ./..."
    elseif filetype == "python" then
        -- Run pytest for the current file
        cmd = "pytest " .. file
    elseif filetype == "javascript" or filetype == "typescript" then
        -- Run Jest for JS/TS
        cmd = "npx jest " .. file
    elseif filetype == "lua" then
        -- Run busted for Lua
        cmd = "busted " .. file
    elseif filetype == "rust" then
        -- Run Rust tests
        cmd = "cargo test"
    elseif filetype == "java" then
        -- Run Java tests with Maven or Gradle
        cmd = "mvn test" -- or use "gradle test" if using Gradle
    else
        print("No test command configured for " .. filetype)
        return
    end

    -- Open a floating terminal to run the tests
    vim.cmd("botright split | resize 10") -- Open a bottom split
    vim.cmd("term " .. cmd) -- Run the command in terminal mode
end

-- Keybinding to run tests
vim.keymap.set("n", "<leader>rt", run_tests, { noremap = true, silent = true })
