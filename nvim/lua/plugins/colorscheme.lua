-- return {
--   "folke/tokyonight.nvim",
--   lazy = false,  -- Load immediately
--   priority = 1000, -- Ensure it loads first
--   config = function()
--     vim.cmd("colorscheme tokyonight-night")
--   end,
-- }


-- return {
--   "morhetz/gruvbox",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme gruvbox")
--   end,
-- }

return {
    "w0ng/vim-hybrid",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd("colorscheme hybrid")
    end,
}
