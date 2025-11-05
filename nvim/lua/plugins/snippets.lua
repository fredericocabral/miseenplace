return {
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp", -- enables regex triggers; optional but nice
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
      enable_autosnippets = false,
    },
    config = function(_, opts)
      local ls = require("luasnip")
      ls.config.set_config(opts)

      -- Load VSCode-format snippets (friendly-snippets + your own .code-snippets)
      require("luasnip.loaders.from_vscode").lazy_load()
      -- Load Lua-format snippets from your local folder
      -- (create files like: ~/.config/nvim/snippets/go.lua)
      --require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
                -- load custom Lua snippets from lua/snippets/
      -- require("luasnip.loaders.from_lua").lazy_load()

      -- Lua modules from *this exact path*
      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/lua/snippets",
      })


      -- Keymaps for expanding/jumping/choice
      vim.keymap.set({ "i", "s" }, "<C-k>", function()
        if ls.expand_or_jumpable() then ls.expand_or_jump() end
      end, { desc = "LuaSnip expand/jump" })

      vim.keymap.set({ "i", "s" }, "<C-j>", function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { desc = "LuaSnip jump back" })

      vim.keymap.set({ "i", "s" }, "<C-l>", function()
        if ls.choice_active() then ls.change_choice(1) end
      end, { desc = "LuaSnip cycle choices" })
    end,
  },
  -- Optional: pre-made snippets
  { "rafamadriz/friendly-snippets" },
}

