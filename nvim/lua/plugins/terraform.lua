return {
  -- dummy plugin to inject filetype logic
  "nvim-lua/plenary.nvim",
  lazy = false, -- force it to load at startup
  config = function()
    vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
      pattern = { "*.tf", "*.tfvars" },
      callback = function()
        vim.bo.filetype = "terraform"
      end,
    })


    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = { "*.tf", "*.tfvars" },
        callback = function()
            vim.cmd("silent! !terraform fmt %")
        end,
    })

  end,
}

