return {
  -- {
  --
  -- 	enabled = false,
  -- 	"nvim-neo-tree/neo-tree.nvim",
  -- },

  {
    enabled = false,
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },

  { "echasnovski/mini.ai", enabled = false },
  -- {
  --   "folke/todo-comments.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim" },
  --   opts = {
  --     -- your configuration comes here
  --     -- or leave it empty to use the default settings
  --     -- refer to the configuration section below
  --   },
  -- },

  {
    "echasnovski/mini.hipatterns",
    event = "BufReadPre",
    opts = {
      highlighters = {

        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        -- fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
        -- hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
        -- todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
        -- note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
        --
        -- Highlight hex color strings (`#rrggbb`) using that color
        -- hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),

        --[[ hsl_colors = {
          pattern = "hsl%(%d+,? %d+%%,? %d+%%%)",
          group = function(_, match)
            local utils = require("solarized-osaka.hsl")

            -- Use tonumber directly in the pattern match
            local h, s, l = match:match("hsl%((%d+),? (%d+)%%,? (%d+)%%%)")

            -- Add print statements to check the values
            -- print("h:", h, "s:", s, "l:", l)

            -- Check if any value is nil
            -- if not h or not s or not l then
            --   print("Error: Failed to extract HSL values from the input.")
            --   return
            -- end

            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)

            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        }, ]]
        --[[ hsl_color = {
          pattern = "hsl%(%d+,? %d+,? %d+%)",
          group = function(_, match)
            local utils = require("solarized-osaka.hsl")
            local h, s, l = match:match("hsl%((%d+),? (%d+),? (%d+)%)")
            h, s, l = tonumber(h), tonumber(s), tonumber(l)
            local hex_color = utils.hslToHex(h, s, l)
            return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
          end,
        }, ]]
      },
    },
  },
  {
    "telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },

      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>fp",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin File",
      },
      {
        "<leader>pf",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            no_ignore = false,
            hidden = true,
            file_ignore_patterns = { ".git/", ".package-lock.json", "node_modules/" },
          })
        end,
        desc = "Lists files in your current working directory, respects .gitignore",
      },

      {
        "<leader>pF",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files({
            hidden = true,
            no_ignore = true,
            file_ignore_patterns = { ".git/", "node_modules", ".package-lock.json", ".next*" },
          })
        end,
        desc = "List all the files",
      },
      -- {
      --   "<leader>g",
      --   function()
      --     local buildin = require("telescope.builtin")
      --     buildin.live_grep()
      --   end,
      -- },
      {
        "<leader>g",
        function()
          local builtin = require("telescope")
          builtin.extensions.live_grep_args.live_grep_args()
        end,
        desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
      },

      -- {
      --   "<leader>h",
      --   function()
      --     local builtin = require("telescope.builtin")
      --     builtin.oldfiles()
      --   end,
      --   desc = "Search for oldfiles or history",
      -- },
      {
        "<leader>s",
        function()
          local builtin = require("telescope.builtin")
          builtin.lsp_document_symbols()
        end,
        desc = "Search for oldfiles or history",
      },
      {

        "<leader>b",
        function()
          local builtin = require("telescope.builtin")
          builtin.buffers()
        end,
        desc = "Lists open buffers",
      },
      {
        "<leader>pt",
        function()
          local builtin = require("telescope.builtin")
          builtin.help_tags()
        end,
        desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
      },
      {
        "<leader>pr",
        function()
          local builtin = require("telescope.builtin")
          builtin.resume()
          --
        end,
        desc = "Resume the previous telescope picker",
      },
      {
        "<leader>pe",
        function()
          local builtin = require("telescope.builtin")
          builtin.diagnostics()
        end,
        desc = "Lists Diagnostics for all open buffers or a specific buffer",
      },
      -- {
      -- 	"<leader>ps",
      -- 	function()
      -- 		local builtin = require("telescope.builtin")
      -- 		builtin.treesitter()
      -- 	end,
      -- 	desc = "Lists Function names, variables, from Treesitter",
      -- },
      {
        "sf",
        function()
          local telescope = require("telescope")

          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "Open File Browser with the path of the current buffer",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
        mappings = {
          n = {},
        },
      })
      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }
      opts.extensions = {
        live_grep_args = {
          mappings = {
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({
                postfix = " --iglob ",
              }),
            },
          },
        },
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("live_grep_args")
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("file_browser")
    end,
  },
}
