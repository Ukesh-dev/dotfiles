-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      -- Remove "prettier" from the list of installed tools
      -- opts.ensure_installed = vim.tbl_filter(function(tool)
      --   return tool ~= "prettier"
      -- end, opts.ensure_installed)

      -- Add "prettierd" to the list of installed tools
      -- table.insert(opts.ensure_installed, "prettierd")
      vim.list_extend(opts.ensure_installed, {
        "prettierd",
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
      })
    end,
  },

  -- lsp servers
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      -- capabilities = {
      -- 	tailwindcss = {},
      -- },

      --- @type lspconfig.options
      servers = {
        -- emmet_ls = {
        --   filetypes = {
        --     "astro",
        --     "css",
        --     "eruby",
        --     "html",
        --     "htmldjango",
        --     "javascriptreact",
        --     "less",
        --     "pug",
        --     "sass",
        --     "scss",
        --     "svelte",
        --     "typescriptreact",
        --     "vue",
        --   },
        -- },
        -- eslint = {
        --   root_dir = function(...)
        --     return require("lspconfig.util").root_pattern(".git", ".eslintrc.*", "eslintrc.*")(...)
        --   end,
        -- },
        -- cssls = {
        --   filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
        -- },
        tailwindcss = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git", "tailwind.*")(...)
          end,
          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  '~H""".*class="([^"]*)".*"""',
                  '~F""".*class="([^"]*)".*"""',
                  "cx\\(([^)]*)",
                  "cn\\(([^)]*)",
                  "cx\\(([^)]*)(?:\"|'|`)([^(?:\"|'|`)]*)(?:\"|'|`)",
                  "cva\\(([^)]*)(?:\"|'|`)([^(?:\"|'|`)]*)(?:\"|'|`)",
                  "cn\\(([^)]*)(?:\"|'|`)([^(?:\"|'|`)]*)(?:\"|'|`)",
                },
              },
              classAttributes = {
                "class",
                "className",
                "ngClass",
                ".*Classes.*",
              },
            },
          },
        },
        tsserver = {
          root_dir = function(...)
            return require("lspconfig.util").root_pattern(".git", "*.ts", "*.tsx", "*.js", "*.jsx")(...)
          end,
          single_file_support = false,
          -- single_file_support = true,
          keys = {
            {
              "<leader>co",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.organizeImports.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Organize Imports",
            },
            {
              "<leader>cR",
              function()
                vim.lsp.buf.code_action({
                  apply = true,
                  context = {
                    only = { "source.removeUnused.ts" },
                    diagnostics = {},
                  },
                })
              end,
              desc = "Remove Unused Imports",
            },
          },
          settings = {
            completion = {
              completeFunctionCalls = true,
            },

            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literal",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        html = {},
        yamlls = {
          settings = {
            yaml = {
              keyOrdering = false,
            },
          },
        },
        lua_ls = {
          -- enabled = false,
          single_file_support = true,
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                workspaceWord = true,
                callSnippet = "Both",
              },
              misc = {
                parameters = {
                  -- "--log-level=trace",
                },
              },
              hint = {
                enable = true,
                setType = false,
                paramType = true,
                paramName = "Disable",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
              doc = {
                privateName = { "^_" },
              },
              type = {
                castNumberToInteger = true,
              },
              diagnostics = {
                disable = { "incomplete-signature-doc", "trailing-space" },
                -- enable = false,
                groupSeverity = {
                  strong = "Warning",
                  strict = "Warning",
                },
                groupFileStatus = {
                  ["ambiguity"] = "Opened",
                  ["await"] = "Opened",
                  ["codestyle"] = "None",
                  ["duplicate"] = "Opened",
                  ["global"] = "Opened",
                  ["luadoc"] = "Opened",
                  ["redefined"] = "Opened",
                  ["strict"] = "Opened",
                  ["strong"] = "Opened",
                  ["type-check"] = "Opened",
                  ["unbalanced"] = "Opened",
                  ["unused"] = "Opened",
                },
                unusedLocalExclude = { "_*" },
              },
              format = {
                enable = false,
                defaultConfig = {
                  indent_style = "space",
                  indent_size = "2",
                  continuation_indent_size = "2",
                },
              },
            },
          },
        },
      },
      setup = {
        -- eslint = function()
        -- 	require("lazyvim.util").lsp.on_attach(function(client)
        -- 		if client.name == "eslint" then
        -- 			client.server_capabilities.documentFormattingProvider = true
        -- 		elseif client.name == "tsserver" then
        -- 			client.server_capabilities.documentFormattingProvider = false
        -- 		end
        -- 	end)
        -- end,
      },
    },
  },
}
