return {
	{
		"stevearc/conform.nvim",
		-- optional = true,
		opts = {
			formatters_by_ft = {
				["javascript"] = { "prettierd" },
				["javascriptreact"] = { "prettierd" },
				["typescript"] = { "prettierd" },
				["typescriptreact"] = { "prettier" },
				["vue"] = { "prettierd" },
				["css"] = { "prettierd" },
				["scss"] = { "prettierd" },
				["less"] = { "prettierd" },
				["html"] = { "prettierd" },
				["json"] = { "prettierd" },
				["jsonc"] = { "prettierd" },
				["yaml"] = { "prettierd" },
				["markdown"] = { "prettierd" },
				["markdown.mdx"] = { "prettierd" },
				["graphql"] = { "prettierd" },
				["handlebars"] = { "prettierd" },
			},
		},

		vim.keymap.set({ "n", "v" }, "<leader>f", function()
			require("conform").format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file or range (in visual mode)" }),
	},
}
