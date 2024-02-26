return {
  -- Create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    enabled = false,
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    config = function()
      require("inc_rename").setup()
    end,
  },

  -- Refactoring tool
  --[[ {
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>rp",
        function()
          require("refactoring").select_refactor()
        end,
        mode = "v",
        noremap = true,
        silent = true,
        expr = false,
      },
    },
    opts = {},
  }, ]]

  -- Go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Better increase/descrease
  {
    "monaqa/dial.nvim",
	   -- stylua: ignore
	   keys = {
	     { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
	     { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
	   },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
          augend.constant.new({ elements = { "let", "const" } }),
        },
      })
    end,
  },

  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    cmd = "SymbolsOutline",
    opts = {
      position = "right",
    },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  {
    "mg979/vim-visual-multi",
  },

  -- {
  -- 	"stevearc/conform.nvim",
  -- 	config = function()
  -- 		local conform = require("conform")
  -- 		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
  -- 			conform.format({
  -- 				lsp_fallback = true,
  -- 				async = false,
  -- 				timeout_ms = 1000,
  -- 			})
  -- 		end, { desc = "Format file or range (in visual mode)" })
  -- 	end,
  -- },
}
