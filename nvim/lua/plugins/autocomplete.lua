return {
  -- {
  --   "hrsh7th/nvim-cmp",
  --   version = false, -- last release is way too old
  --   event = "InsertEnter",
  --   dependencies = {
  --     "hrsh7th/cmp-nvim-lsp",
  --     "hrsh7th/cmp-buffer",
  --     "hrsh7th/cmp-path",
  --     "saadparwaiz1/cmp_luasnip",
  --   },
  --   opts = function()
  --     return {
  --       completion = {
  --         completeopt = "menu,menuone,noselect",
  --       },
  --       -- snippet = {
  --       --   expand = function(args)
  --       --     require("luasnip").lsp_expand(args.body)
  --       --   end,
  --       -- },
  --     }
  --   end,
  -- },

  {
    "hrsh7th/cmp-cmdline",
    config = function(_, opts)
      local cmp = require("cmp")
      -- `/` cmdline setup.
      -- opts.preselect = cmp.PreselectMode.noinsert
      --[[ opts.completion = {
        completeopt = "noinsert",
      } ]]

      cmp.setup.cmdline("/", {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- `:` cmdline setup.
      cmp.setup.cmdline(":", {
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
      cmp.setup({
        --[[ completion = {
          completeopt = "menu,menuone,noselect",
        },
        preselect = cmp.PreselectMode.None, ]]
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        cmp.mapping.confirm({ select = true }),
        cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
      })
    end,
  },
}
