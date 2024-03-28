-- Initialize the table with default values
local highlights = {
  -- other highlight definitions...

  -- Initialize '@include' with an empty table if it doesn't exist
  ["@include"] = {},
}
return {
  "xiyaowong/transparent.nvim",
  {

    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
        functions = { italic = true },
      }
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
      background = { light = "latte", dark = "mocha" },
      dim_inactive = {
        enabled = false,
        -- Dim inactive splits/windows/buffers.
        -- NOT recommended if you use old palette (a.k.a., mocha).
        shade = "dark",
        percentage = 0.15,
      },
      transparent_background = transparent_background,
      show_end_of_buffer = false, -- show the '~' characters after the end of buffers
      term_colors = true,
      compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
      styles = {
        comments = { "italic" },
        properties = { "italic" },
        functions = { "bold" },
        keywords = { "italic" },
        operators = { "bold" },
        conditionals = { "bold" },
        loops = { "bold" },
        booleans = { "bold", "italic" },
        numbers = {},
        types = {},
        strings = {},
        variables = {},
      },
      integrations = {
        treesitter = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
        },
        aerial = true,
        alpha = false,
        barbar = false,
        beacon = false,
        cmp = true,
        coc_nvim = false,
        dap = true,
        dap_ui = true,
        dashboard = false,
        dropbar = { enabled = true, color_mode = true },
        fern = false,
        fidget = true,
        flash = true,
        gitgutter = false,
        gitsigns = true,
        harpoon = false,
        headlines = false,
        hop = true,
        illuminate = true,
        indent_blankline = { enabled = true, colored_indent_levels = false },
        leap = false,
        lightspeed = false,
        lsp_saga = true,
        lsp_trouble = true,
        markdown = true,
        mason = true,
        mini = false,
        navic = { enabled = false },
        neogit = false,
        neotest = false,
        neotree = { enabled = false, show_root = true, transparent_panel = false },
        noice = false,
        notify = true,
        nvimtree = true,
        overseer = false,
        pounce = false,
        rainbow_delimiters = true,
        sandwich = false,
        semantic_tokens = true,
        symbols_outline = false,
        telekasten = false,
        telescope = { enabled = true, style = "nvchad" },
        treesitter_context = true,
        ts_rainbow = false,
        vim_sneak = false,
        vimwiki = false,
        which_key = true,
      },
      color_overrides = {},
      highlight_overrides = {
        ---@param cp palette
        all = function(cp)
          return {
            -- For base configs
            NormalFloat = { fg = cp.text, bg = transparent_background and cp.none or cp.mantle },
            FloatBorder = {
              fg = transparent_background and cp.blue or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },
            CursorLineNr = { fg = cp.green },

            -- For native lsp configs
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { bg = cp.none },
            LspInfoBorder = { link = "FloatBorder" },

            -- For mason.nvim
            MasonNormal = { link = "NormalFloat" },

            -- For indent-blankline
            IblIndent = { fg = cp.surface0 },
            IblScope = { fg = cp.surface2, style = { "bold" } },

            -- For nvim-cmp and wilder.nvim
            Pmenu = { fg = cp.overlay2, bg = transparent_background and cp.none or cp.base },
            PmenuBorder = { fg = cp.surface1, bg = transparent_background and cp.none or cp.base },
            PmenuSel = { bg = cp.green, fg = cp.base },
            CmpItemAbbr = { fg = cp.overlay2 },
            CmpItemAbbrMatch = { fg = cp.blue, style = { "bold" } },
            CmpDoc = { link = "NormalFloat" },
            CmpDocBorder = {
              fg = transparent_background and cp.surface1 or cp.mantle,
              bg = transparent_background and cp.none or cp.mantle,
            },

            -- For fidget
            FidgetTask = { bg = cp.none, fg = cp.surface2 },
            FidgetTitle = { fg = cp.blue, style = { "bold" } },

            -- For nvim-tree
            NvimTreeRootFolder = { fg = cp.pink },
            NvimTreeIndentMarker = { fg = cp.surface2 },

            -- For trouble.nvim
            TroubleNormal = { bg = transparent_background and cp.none or cp.base },

            -- For telescope.nvim
            TelescopeMatching = { fg = cp.lavender },
            TelescopeResultsDiffAdd = { fg = cp.green },
            TelescopeResultsDiffChange = { fg = cp.yellow },
            TelescopeResultsDiffDelete = { fg = cp.red },

            -- For glance.nvim
            GlanceWinBarFilename = { fg = cp.subtext1, style = { "bold" } },
            GlanceWinBarFilepath = { fg = cp.subtext0, style = { "italic" } },
            GlanceWinBarTitle = { fg = cp.teal, style = { "bold" } },
            GlanceListCount = { fg = cp.lavender },
            GlanceListFilepath = { link = "Comment" },
            GlanceListFilename = { fg = cp.blue },
            GlanceListMatch = { fg = cp.lavender, style = { "bold" } },
            GlanceFoldIcon = { fg = cp.green },

            -- For nvim-treehopper
            TSNodeKey = {
              fg = cp.peach,
              bg = transparent_background and cp.none or cp.base,
              style = { "bold", "underline" },
            },

            -- For treesitter
            ["@keyword.return"] = { fg = cp.pink, style = clear },
            ["@error.c"] = { fg = cp.none, style = clear },
            ["@error.cpp"] = { fg = cp.none, style = clear },
          }
        end,
      },
      transparent_background = false,
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
      },
      color_overrides = {
        mocha = {
          base = "#000000",
          mantle = "#000000",
          crust = "#000000",
        },
      },
      integrations = {
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        dropbar = {
          enabled = true,
          color_mode = true,
        },
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    lualine_bold = true,
    opts = {
      style = "night",
      transparent = true,
      styles = {
        sidebars = "transparent",
        keywords = { bold = true, italic = true },
        functions = { bold = true },
        -- keywords = { italic = true, gui = "italic" },
        floats = "transparent",
      },
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },

      on_highlights = function(hl, c)
        -- highlights["@include"].style = { italic = true }
        hl["@constructor"].style = { italic = true }
        hl["@keyword"].style = { italic = true }
        hl["@keyword.return"].style = { italic = true }
        hl["@keyword.storage"].style = { italic = true }
        -- highlights["@field"].style = { italic = true }
        hl["SpecialKey"].style = { italic = true }
        -- highlights["@include"].style = { italic = true }
        hl["Function"].style = { italic = true }
        -- highlights["Label"].style = { italic = true }

        local util = require("tokyonight.util")
        local prompt = "#2d3149"

        hl.BufferlineInactive = {
          bg = c.bg_dark,
        }
        hl.BufferlineActiveSeparator = {
          bg = c.bg,
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
        hl.BufferlineInactiveSeparator = {
          bg = c.bg_dark,
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }

        hl.NeoTreeFileNameOpened = {
          fg = c.orange,
        }

        hl.GitSignsCurrentLineBlame = {
          fg = c.fg_gutter,
        }

        -- Tabs
        hl.TabActive = {
          bg = c.bg,
        }
        hl.TabActiveSeparator = {
          bg = c.bg,
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
        hl.TabInactive = {
          bg = c.bg_dark,
        }
        hl.TabInactiveSeparator = {
          bg = c.bg_dark,
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }

        hl.SidebarTabActive = {
          bg = c.bg_dark,
        }
        hl.SidebarTabActiveSeparator = {
          bg = c.bg_dark,
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
        hl.SidebarTabInactive = {
          bg = util.darken(c.bg_dark, 0.75, "#000000"),
          fg = c.comment,
        }
        hl.SidebarTabInactiveSeparator = {
          bg = util.darken(c.bg_dark, 0.75, "#000000"),
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
        }

        hl.StatusLine = {
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
          fg = c.fg_dark,
        }
        hl.StatusLineComment = {
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
          fg = c.comment,
        }

        hl.LineNrAbove = {
          fg = c.fg_gutter,
        }
        hl.LineNr = {
          fg = util.lighten(c.fg_gutter, 0.7),
        }
        hl.LineNrBelow = {
          fg = c.fg_gutter,
        }

        hl.MsgArea = {
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
        }

        -- Telescope
        hl.TelescopePromptBorder = {
          fg = "#27a1b9",
        }
        hl.TelescopePromptTitle = {
          fg = "#27a1b9",
        }

        -- Spelling
        hl.SpellBad = {
          undercurl = true,
          sp = "#7F3A43",
        }

        -- Indent
        hl.IblIndent = {
          fg = c.bg_highlight,
        }
        hl.IblScope = {
          fg = util.lighten(c.bg_highlight, 0.95),
        }

        hl.DiagnosticUnnecessary = {
          fg = "#778bba",
        }

        hl["@punctuation.bracket"] = {
          fg = "#8e94c6",
        }
        hl.Comment = {
          -- fg = "#8e94c6",
          fg = "#778bba",
          italic = true,
        }

        -- Floaterm
        hl.Floaterm = {
          bg = prompt,
        }
        hl.FloatermBorder = {
          bg = prompt,
          fg = prompt,
        }
        hl["@keyword.import"] = {
          italic = true,
          fg = "#7DCFFF",
        }

        -- Copilot
        hl.CopilotSuggestion = {
          fg = c.comment,
        }

        -- NvimTree
        hl.NvimTreeIndentMarker = {
          fg = c.bg_highlight,
        }
        hl.NvimTreeOpenedFile = {
          fg = c.fg,
          bold = true,
        }
        hl.NvimTreeNormal = {
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
        hl.NvimTreeNormalNC = {
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
        hl.NvimTreeWinSeparator = {
          fg = util.darken(c.bg_dark, 0.85, "#000000"),
          bg = util.darken(c.bg_dark, 0.85, "#000000"),
        }
      end,

      on_colors = function(colors)
        -- local util = require("tokyonight.util")
        colors.gitSigns = {
          add = colors.teal,
          change = colors.purple,
          delete = colors.red,
        }
        -- colors.bg = "#011727"
        -- colors.bg_statusline = colors.none -- To check if its working try something like "#ff00ff" instead of colors.none
        -- colors.bg_visual = "#778bba"
        -- colors.fg_dark = "#8e94c6" -- this is for dark brackets
        -- colors.comment = "#8e94c6"
        -- colors.terminal_black = "#778bba" --this is for comment
        -- colors.fg_gutter = "#5b5d78"
        colors.statement = {
          italice = true,
        }
        colors.CursorLineNr = "#b28bcf"
        colors.lineNr = {
          fg = "#bada55",
          bg = "#bada55",
        }
      end,
    },
  },
}
