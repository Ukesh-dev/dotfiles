local u = require("ukesh.utils")
return {
  { "tpope/vim-surround" },
  -- {
  --   "NStefan002/visual-surround.nvim",
  --   config = function()
  --     require("visual-surround").setup({
  --       -- your config
  --       -- if set to true, the user must manually add keymaps
  --       use_default_keymaps = true,
  --       -- will be ignored if use_default_keymaps is set to false
  --       surround_chars = { "{", "}", "[", "]", "(", ")", "'", '"', "`" },
  --       -- whether to exit visual mode after adding surround
  --       exit_visual_mode = true,
  --     })
  --   end,
  -- },
  { "tpope/vim-eunuch" },
  -- {
  --   "bakks/butterfish.nvim",
  --   dependencies = { "tpope/vim-commentary" },
  -- config = function()
  --   local opts = { noremap = true, silent = true }
  --   vim.keymap.set("n", ",p", ":BFFilePrompt ", opts)
  --   vim.keymap.set("n", ",r", ":BFRewrite ", opts)
  --   vim.keymap.set("v", ",r", ":BFRewrite ", opts)
  --   vim.keymap.set("n", ",c", ":BFComment<CR>", opts)
  --   vim.keymap.set("v", ",c", ":BFComment<CR>", opts)
  --   vim.keymap.set("n", ",e", ":BFExplain<CR>", opts)
  --   vim.keymap.set("v", ",e", ":BFExplain<CR>", opts)
  --   vim.keymap.set("n", ",f", ":BFFix<CR>", opts)
  --   vim.keymap.set("n", ",i", ":BFImplement<CR>", opts)
  --   vim.keymap.set("n", ",d", ":BFEdit ", opts)
  --   vim.keymap.set("n", ",h", ":BFHammer<CR>", opts)
  --   vim.keymap.set("n", ",q", ":BFQuestion ", opts)
  --   vim.keymap.set("v", ",q", ":BFQuestion ", opts)
  -- end,
  -- },
  { "tpope/vim-unimpaired" },
  -- Indent autodetection with editorconfig support
  { "tpope/vim-sleuth" },
  -- Allow plugins to enable repeating of commands.
  { "tpope/vim-repeat" },
  { "MaxMEllon/vim-jsx-pretty" },
  -- Add more languages.
  -- { "sheerun/vim-polyglot" },

  -- { "christoomey/vim-tmux-navigator" },
  { "gregorias/coerce.nvim", tag = "v0.1.1", config = true },
  {
    "chrisgrieser/nvim-chainsaw",
    init = function()
      u.leaderSubkey("l", " Log")
    end,
    opts = { marker = "👽" },
    keys = {
			-- stylua: ignore start
			{"<leader>lb", "<cmd>lua require('chainsaw').beepLog()<CR>", desc = "󰸢 beep log" },
			{"<leader>ll", "<cmd>lua require('chainsaw').variableLog()<CR>", mode = {"n", "x"}, desc = "󰸢 variable log" },
			{"<leader>lo", "<cmd>lua require('chainsaw').objectLog()<CR>", mode = {"n", "x"}, desc = "󰸢 object log" },
			{"<leader>lm", function() require("chainsaw").messageLog() end, desc = "󰸢 message log" },
			{"<leader>lt", function() require("chainsaw").timeLog() end, desc = "󰸢 time log" },
			{"<leader>ld", function() require("chainsaw").debugLog() end, desc = "󰸢 debugger log" },
			{"<leader>la", function() require("chainsaw").assertLog() end, mode = {"n", "x"}, desc = "󰸢 assert log" },

			{"<leader>lr", function() require("chainsaw").removeLogs() end, desc = "󰹝 remove logs" },
      -- stylua: ignore end
    },
  },
  -- 	{
  --   "AgusDOLARD/backout.nvim",
  --   opts = {},
  --   keys = {
  --     -- Define your keybinds
  --     { "<M-b>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
  --     { "<Ctrl-n>", "<cmd>lua require('backout').out()<cr>", mode = { "i" } },
  --   },
  -- },

  -- Jump to the last location when opening a file
  { "farmergreg/vim-lastplace" },

  -- Enable * searching with visually selected text.
  { "nelstrom/vim-visual-star-search" },

  -- Automatically create parent dirs when saving.
  { "jessarcher/vim-heritage" },

  { "whatyouhide/vim-textobj-xmlattr", dependencies = { "kana/vim-textobj-user" } },
  {
    "HakonHarnes/img-clip.nvim",
    event = "BufEnter",
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
    },
  },
  --[[ {
    "gregorias/nvim-mapper",
    dependencies = "nvim-telescope/telescope.nvim",
    config = function()
      require("nvim-mapper").setup({})
    end,
  }, ]]
  -- breadCrumbs
  --[[ {

    "LunarVim/breadcrumbs.nvim",
  }, ]]
}
