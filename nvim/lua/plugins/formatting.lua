return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- linters_by_ft = {
      -- 	javascript = { "eslint_d" },
      -- 	typescript = { "eslint_d" },
      -- 	javascriptreact = { "eslint_d" },
      -- 	typescriptreact = { "eslint_d" },
      -- 	svelte = { "eslint_d" },
      -- 	kotlin = { "ktlint" },
      -- 	terraform = { "tflint" },
      -- 	ruby = { "standardrb" },
      -- },
    },
  },
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>fm",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
          })
        end,
        { desc = "Format file or range (in visual mode)" },
      },
    },
    event = { "BufReadPre", "BufNewFile" },

    opts = {
      format = function()
        -- Customize prettier args
        --[[ require("conform.formatters.prettier").args = function(ctx)
          local prettier_roots = { ".prettierrc", ".prettierrc.json", "prettier.config.js" }
          local args = { "--stdin-filepath", "$FILENAME" }

          local localPrettierConfig = vim.fs.find(prettier_roots, {
            upward = true,
            path = ctx.dirname,
            type = "file",
          })[1]
          local globalPrettierConfig = vim.fs.find(prettier_roots, {
            path = vim.fn.stdpath("config"),
            type = "file",
          })[1]
          local disableGlobalPrettierConfig = os.getenv("DISABLE_GLOBAL_PRETTIER_CONFIG")

          -- Project config takes precedence over global config
          if localPrettierConfig then
            vim.list_extend(args, { "--config", localPrettierConfig })
          elseif globalPrettierConfig and not disableGlobalPrettierConfig then
            vim.list_extend(args, { "--config", globalPrettierConfig })
          end

          local hasTailwindPrettierPlugin = vim.fs.find("node_modules/prettier-plugin-tailwindcss", {
            upward = true,
            path = ctx.dirname,
            type = "directory",
          })[1]

          if hasTailwindPrettierPlugin then
            vim.list_extend(args, { "--plugin", "prettier-plugin-tailwindcss" })
          end

          return args
        end ]]
      end,

      formatters_by_ft = {
        lua = { "stylua" },
        svelte = { { "prettierd", "prettier" } },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier" } },
        graphql = { { "prettierd", "prettier" } },
        java = { "google-java-format" },
        kotlin = { "ktlint" },
        ruby = { "standardrb" },
        markdown = { { "prettierd", "prettier" } },
        python = { { "black" } },
        erb = { "htmlbeautifier" },
        html = { "htmlbeautifier" },
        bash = { "beautysh" },
        proto = { "buf" },
        rust = { "rustfmt" },
        yaml = { "yamlfix" },
        toml = { "taplo" },
        css = { { "prettierd", "prettier" } },
        scss = { { "prettierd", "prettier" } },
      },

      --[[ formatters = {
        -- Customize prettier args
        prettierd = {
          condition = function(self, ctx)
            local prettier_roots = { ".prettierrc", ".prettierrc.json", "prettier.config.js" }
            return vim.fs.find(prettier_roots, { path = ctx.filename, upward = true })
          end,
        },
      }, ]]
      -- format_after_save = function(bufnr)
      -- 	-- Disable autoformat on certain filetypes
      -- 	local ignore_filetypes = { "sql", "java", "typescript", "typescriptreact" }
      -- 	if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
      -- 		return
      -- 	end
      -- 	-- Disable with a global or buffer-local variable
      -- 	if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
      -- 		return
      -- 	end
      -- 	-- Disable autoformat for files in a certain path
      -- 	local bufname = vim.api.nvim_buf_get_name(bufnr)
      -- 	if bufname:match("/node_modules/") then
      -- 		return
      -- 	end
      -- 	-- ...additional logic...
      -- 	return { timeout_ms = 500, lsp_fallback = true }
      -- end,
    },

    -- vim.keymap.set({ "n", "v" }, "<leader>f", function()
    -- 	require("conform").format({
    -- 		lsp_fallback = true,
    -- 		async = false,
    -- 		timeout_ms = 500,
    -- 	})
    -- end, { desc = "Format file or range (in visual mode)" }),
  },
}

-- require("conform").setup({
--   format_on_save = function(bufnr)
--     -- Disable with a global or buffer-local variable
--     if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
--       return
--     end
--     return { timeout_ms = 500, lsp_fallback = true }
--   end,
-- })
