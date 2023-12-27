return {
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
			term_colors = true,
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
		},
	},
	-- {
	-- 	"bluz71/vim-nightfly-guicolors",
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	--
	-- 	config = function()
	-- 		-- load the colorscheme here
	-- 		vim.cmd([[colorscheme nightfly]])
	-- 	end,
	-- },
	-- {
	--
	-- 	"oxfist/night-owl.nvim",
	-- 	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	-- 	priority = 1000, -- make sure to load this before all the other start plugins
	-- 	-- opts = function()
	-- 	-- 	return {
	-- 	-- 		transparent = true,
	-- 	-- 	}
	-- 	-- end,
	-- 	opts = {
	-- 		transparent = true,
	-- 	},
	--
	-- },
	{
		"jessarcher/onedark.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
	},
}
-- return {
-- 	"bluz71/vim-nightfly-colors",
-- 	priority = 1000,
-- 	-- config = function()
-- 	-- 	vim.cmd([[colorscheme nightfly]])
-- 	-- end,
-- -- }
