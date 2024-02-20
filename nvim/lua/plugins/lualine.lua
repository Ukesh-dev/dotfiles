return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
      "arkav/lualine-lsp-progress",
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local harpoon = require("harpoon.mark")
      local function harpoon_component()
        local total_marks = harpoon.get_length()

        if total_marks == 0 then
          return ""
        end

        local current_mark = "—"

        local mark_idx = harpoon.get_current_index()
        if mark_idx ~= nil then
          current_mark = tostring(mark_idx)
        end

        return string.format("󱡅 %s/%d", current_mark, total_marks)
      end
      require("lualine").setup({
        options = {
          section_separators = "",
          component_separators = "",
          globalstatus = true,
          theme = {
            normal = {
              a = "StatusLine",
              b = "StatusLine",
              c = "StatusLine",
            },
          },
        },

        sections = {
          lualine_a = {
            "mode",
          },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = { added = " ", modified = " ", removed = " " },
            },
            harpoon_component,
            function()
              return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.buf_get_clients())) or "")
            end,
            { "diagnostics", sources = { "nvim_diagnostic" } },
          },
          lualine_c = {
            "filename",
          },
          lualine_x = {
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = { fg = "#ff9e64" },
            },
          },
          lualine_y = {
            "filetype",
            "encoding",
            "fileformat",
            '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
          },
          lualine_z = {
            "searchcount",
            "selectioncount",
            "location",
            "progress",
          },
        },
      })
    end,
    --[[ opts = {
      options = {
        section_separators = "",
        component_separators = "",
        globalstatus = true,
        theme = {
          normal = {
            a = "StatusLine",
            b = "StatusLine",
            c = "StatusLine",
          },
        },
      },
      sections = {},
    }, ]]
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --
  --   config = function()
  --     local harpoon = require("harpoon.mark")
  --     local function harpoon_component()
  --       local total_marks = harpoon.get_length()
  --
  --       if total_marks == 0 then
  --         return ""
  --       end
  --
  --       local current_mark = "—"
  --
  --       local mark_idx = harpoon.get_current_index()
  --       if mark_idx ~= nil then
  --         current_mark = tostring(mark_idx)
  --       end
  --
  --       return string.format("󱡅 %s/%d", current_mark, total_marks)
  --     end
  --     require("lualine").setup({
  --       --[[ options = {
  --         theme = "catppuccin",
  --         globalstatus = true,
  --         component_separators = { left = "█", right = "█" },
  --         section_separators = { left = "█", right = "█" },
  --       },
  --       sections = {
  --         lualine_b = {
  --           { "branch", icon = "", fmt = truncate_branch_name },
  --           harpoon_component,
  --           "diff",
  --           "diagnostics",
  --         },
  --         lualine_c = {
  --           { "filename", path = 1 },
  --         },
  --         lualine_x = {
  --           "filetype",
  --         },
  --       }, ]]
  --       options = {
  --         -- globalstatus = false,
  --         theme = "solarized_dark",
  --         -- theme = "night-owl",
  --         icons_enabled = true,
  --         -- component_separators = { left = '', right = '' },
  --         --   section_separators = { left = '', right ='' },
  --         -- component_separators = ">",
  --         -- section_separators = "",
  --         -- component_separators = ">",
  --         -- section_separators = "",
  --
  --         -- theme = "catppuccin",
  --         -- theme = "tokyonight",
  --       },
  --
  --       -- sections = {
  --       -- 	lualine_x = {
  --       -- 		{
  --       -- 			require("noice").api.statusline.mode.get,
  --       -- 			cond = require("noice").api.statusline.mode.has,
  --       -- 		},
  --       -- 	},
  --       -- 	lualine_a = {
  --       -- 		{
  --       -- 			"mode",
  --       -- 			"buffers",
  --       -- 		},
  --       -- 	},
  --       --
  --       -- 	lualine_b = {
  --       -- 		{
  --       --
  --       -- 			"branch",
  --       -- 			color = { bg = "transparent" },
  --       -- 		},
  --       -- 		{
  --       --
  --       -- 			"diff",
  --       -- 			symbols = { added = " ", modified = " ", removed = " " },
  --       -- 			color = { bg = "transparent" },
  --       -- 		},
  --       -- 		-- function()
  --       -- 		-- 	return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
  --       -- 		-- end,
  --       -- 		-- { "diagnostics", sources = { "nvim_diagnostic" }, color = { fg = "#ff9e64" } },
  --       -- 	},
  --       -- 	lualine_c = {
  --       -- 		"filename",
  --       -- 	},
  --       -- },
  --       sections = {
  --         lualine_b = {
  --           {
  --
  --             "branch",
  --             -- color = { guibg = "none", bg = "none" },
  --           },
  --           { harpoon_component },
  --           {
  --
  --             "diff",
  --             -- color = { bg = "none" },
  --             symbols = { added = " ", modified = " ", removed = " " },
  --             -- color = { bg = "#bada55" },
  --           },
  --           function()
  --             return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
  --           end,
  --           {
  --             "diagnostics",
  --             sources = { "nvim_diagnostic" },
  --             diagnostics_color = {
  --               -- Same values as the general color option can be used here.
  --               hint = { fg = "#166534" }, -- Changes diagnostics' info color.
  --             },
  --           },
  --         },
  --         lualine_c = {
  --           {
  --             "filename",
  --             path = 1,
  --           },
  --         },
  --         lualine_x = {
  --           {
  --             require("lazy.status").updates,
  --             cond = require("lazy.status").has_updates,
  --             -- color = { fg = "#ff9e64" },
  --             color = { fg = "#ff9e64" },
  --           },
  --           -- {
  --           -- 	"diff",
  --           -- 	symbols = { added = " ", modified = " ", removed = " " },
  --           -- 	color = { fg = "#ff9e64" },
  --           -- },
  --         },
  --         lualine_y = {
  --           "filetype",
  --           "encoding",
  --           "fileformat",
  --           -- '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
  --         },
  --         lualine_z = {
  --           "searchcount",
  --           -- "selectioncount",
  --           -- "location",
  --           "progress",
  --         },
  --       },
  --     })
  --   end,
  --
  --   -- opts = {
  --   --   options = {
  --   --     -- globalstatus = false,
  --   --     theme = "solarized_dark",
  --   --     -- theme = "night-owl",
  --   --     icons_enabled = true,
  --   --     -- component_separators = { left = '', right = '' },
  --   --     --   section_separators = { left = '', right ='' },
  --   --     -- component_separators = ">",
  --   --     -- section_separators = "",
  --   --     -- component_separators = ">",
  --   --     -- section_separators = "",
  --   --
  --   --     -- theme = "catppuccin",
  --   --     -- theme = "tokyonight",
  --   --   },
  --   --
  --   --   -- sections = {
  --   --   -- 	lualine_x = {
  --   --   -- 		{
  --   --   -- 			require("noice").api.statusline.mode.get,
  --   --   -- 			cond = require("noice").api.statusline.mode.has,
  --   --   -- 		},
  --   --   -- 	},
  --   --   -- 	lualine_a = {
  --   --   -- 		{
  --   --   -- 			"mode",
  --   --   -- 			"buffers",
  --   --   -- 		},
  --   --   -- 	},
  --   --   --
  --   --   -- 	lualine_b = {
  --   --   -- 		{
  --   --   --
  --   --   -- 			"branch",
  --   --   -- 			color = { bg = "transparent" },
  --   --   -- 		},
  --   --   -- 		{
  --   --   --
  --   --   -- 			"diff",
  --   --   -- 			symbols = { added = " ", modified = " ", removed = " " },
  --   --   -- 			color = { bg = "transparent" },
  --   --   -- 		},
  --   --   -- 		-- function()
  --   --   -- 		-- 	return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
  --   --   -- 		-- end,
  --   --   -- 		-- { "diagnostics", sources = { "nvim_diagnostic" }, color = { fg = "#ff9e64" } },
  --   --   -- 	},
  --   --   -- 	lualine_c = {
  --   --   -- 		"filename",
  --   --   -- 	},
  --   --   -- },
  --   --   sections = {
  --   --     lualine_b = {
  --   --       {
  --   --
  --   --         "branch",
  --   --         -- color = { guibg = "none", bg = "none" },
  --   --       },
  --   --       {
  --   --
  --   --         "diff",
  --   --         -- color = { bg = "none" },
  --   --         symbols = { added = " ", modified = " ", removed = " " },
  --   --         -- color = { bg = "#bada55" },
  --   --       },
  --   --       function()
  --   --         return "󰅭 " .. vim.pesc(tostring(#vim.tbl_keys(vim.lsp.get_clients())) or "")
  --   --       end,
  --   --       {
  --   --         "diagnostics",
  --   --         sources = { "nvim_diagnostic" },
  --   --         diagnostics_color = {
  --   --           -- Same values as the general color option can be used here.
  --   --           hint = { fg = "#166534" }, -- Changes diagnostics' info color.
  --   --         },
  --   --       },
  --   --     },
  --   --     lualine_c = {
  --   --       {
  --   --         "filename",
  --   --         path = 1,
  --   --       },
  --   --     },
  --   --     lualine_x = {
  --   --       {
  --   --         require("lazy.status").updates,
  --   --         cond = require("lazy.status").has_updates,
  --   --         -- color = { fg = "#ff9e64" },
  --   --         color = { fg = "#ff9e64" },
  --   --       },
  --   --       -- {
  --   --       -- 	"diff",
  --   --       -- 	symbols = { added = " ", modified = " ", removed = " " },
  --   --       -- 	color = { fg = "#ff9e64" },
  --   --       -- },
  --   --     },
  --   --     lualine_y = {
  --   --       "filetype",
  --   --       "encoding",
  --   --       "fileformat",
  --   --       -- '(vim.bo.expandtab and "␠ " or "⇥ ") .. vim.bo.shiftwidth',
  --   --     },
  --   --     lualine_z = {
  --   --       "searchcount",
  --   --       -- "selectioncount",
  --   --       -- "location",
  --   --       "progress",
  --   --     },
  --   --   },
  --   -- },
  -- },
}
