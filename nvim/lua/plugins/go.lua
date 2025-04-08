--return {
  -- dummy plugin to inject filetype logic
  --"nvim-lua/plenary.nvim",
  --lazy = false, -- force it to load at startup
  --config = function()
  --  -- autoformat go file before saving
  --  vim.api.nvim_create_autocmd("BufWritePre", {
  --      pattern = "*.go",
  --      callback = function()
  --          vim.lsp.buf.format({ async = false }) -- Format before saving
  --      end,
  --  })

  --end,
--}
--
--

return {
    "fatih/vim-go",
    build = ":GoInstallBinaries", -- runs after install/update
    config = function()
        -- Optional config
        vim.g.go_fmt_command = "goimports"
        vim.g.go_def_mode = "gopls"
        vim.g.go_info_mode = "gopls"
    end,
}

