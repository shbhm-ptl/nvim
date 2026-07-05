return {
	-- fancy cmdline / messages / popup UI
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				-- lspsaga already handles hover/signature UI
				hover = { enabled = false },
				signature = { enabled = false },
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				lsp_doc_border = true,
			},
		},
	},

	-- labeled jump navigation, also enhances f/F/t/T
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{
				"<leader>j",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash Jump",
			},
		},
	},

	-- highlight and search TODO/FIX/HACK/NOTE comments
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
		keys = {
			{ "<leader>ft", "<cmd>TodoTelescope<CR>", desc = "Find todos" },
			{
				"]T",
				function()
					require("todo-comments").jump_next()
				end,
				desc = "Next todo comment",
			},
			{
				"[T",
				function()
					require("todo-comments").jump_prev()
				end,
				desc = "Prev todo comment",
			},
		},
	},

	-- animated cursor trail
	{
		"sphamba/smear-cursor.nvim",
		event = "VeryLazy",
		opts = {},
	},

	-- pretty diagnostics/quickfix panel
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>d", "<cmd>Trouble diagnostics toggle<CR>", desc = "Diagnostics (Trouble)" },
			{ "<leader>D", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics (Trouble)" },
		},
	},

	-- show color swatches for hex/rgb/hsl values
	{
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},

	-- render markdown in-buffer (headings, code blocks, tables, checkboxes)
	{
		"MeanderingProgrammer/render-markdown.nvim",
		ft = { "markdown" },
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {},
	},
}
