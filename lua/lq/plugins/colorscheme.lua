return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- matches Ghostty + tmux
				background = { dark = "mocha" },
				transparent_background = false,
				term_colors = true,
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					treesitter = true,
					native_lsp = { enabled = true },
					telescope = { enabled = true },
					which_key = true,
					gitsigns = true,
					nvimtree = true,
					mason = true,
					cmp = true,
					indent_blankline = { enabled = true },
					lsp_saga = true,
					harpoon = true,
					snacks = { enabled = true },
				},
			})
		end,
	},
	{
		"folke/tokyonight.nvim",
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				transparent = false,
				terminal_colors = true,
				styles = {
					sidebars = "transparent",
					floats = "transparent",
				},
				sidebars = { "qf", "help" },

				on_highlights = function(hl, c)
					hl.LineNr = {
						fg = "#bb9af7",
					}
					hl.BufferLineFill = {
						bg = c.black,
					}
				end,
			})
		end,
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
	},
}
