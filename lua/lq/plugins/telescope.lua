return {
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			{
				"nvim-tree/nvim-web-devicons",
			},
			{
				-- Maintained fork of ahmedkhalf/project.nvim (upstream is abandoned and
				-- calls the deprecated vim.lsp.buf_get_clients(), which flashes a red
				-- warning on startup with Neovim 0.12+). Same module name, drop-in.
				"DrKJeff16/project.nvim", -- need this plugin for now to find git root for telescope searching
				config = function()
					-- NOTE: the fork's module is `project` (not `project_nvim`)
					require("project").setup({
						--- Manual mode doesn't automatically change your root directory, so you have
						--- the option to manually do so using the `:ProjectRoot` command.
						manual_mode = false,

						-- patterns used to detect the project root (vim-rooter style);
						-- LSP-based detection is also on by default (see `lsp` option)
						patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

						-- Show hidden files in telescope when searching for files in a project
						show_hidden = false,

						-- When set to false, you get a message whenever project.nvim changes directory
						silent_chdir = true,
					})
				end,
			},
		},
		config = function()
			require("lq.configs.telescope")
		end,
	},
}
