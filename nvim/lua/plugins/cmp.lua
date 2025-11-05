return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local ls  = require("luasnip")

      -- make sure autocomplete actually triggers on typing
      opts.completion = {
        autocomplete = { cmp.TriggerEvent.TextChanged, cmp.TriggerEvent.InsertEnter },
        keyword_length = 1,
        completeopt = "menu,menuone,noselect",
      }

      -- snippet engine
      opts.snippet = { expand = function(a) ls.lsp_expand(a.body) end }

      -- format: show a source label (so you can spot snippets)
      opts.formatting = {
        format = function(entry, vim_item)
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip  = "[Snip]",
            buffer   = "[Buf]",
            path     = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      }

      -- global default sources (put snippets first)
      opts.sources = cmp.config.sources({
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "buffer" },
      })

      -- ensure Go keeps these sources (some setups override per-ft)
      cmp.setup.filetype("go", {
        sources = opts.sources,
      })

      -- handy keys
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"]      = cmp.mapping.confirm({ select = true }),
      })

      return opts
    end,
  },

  -- Load snippets early and reliably
  {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_lua").load({
        paths = vim.fn.stdpath("config") .. "/snippets",
      })
    end,
  },
}

