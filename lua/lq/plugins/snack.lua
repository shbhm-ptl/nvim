return {
	{
		"folke/snacks.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			gitbrowse = { enabled = true, what = "permalink" },
			notifier = { enabled = true, timeout = 3000 },
			indent = {
				enabled = true,
				char = "▏",
				animate = { enabled = true },
				scope = { enabled = true, char = "▏" },
			},
			scroll = { enabled = true },
			words = { enabled = true },
			zen = { enabled = true },
			-- renders images inline (ghostty/kitty graphics protocol)
			image = { enabled = true },
			dashboard = {
				enabled = true,
				preset = {
					header = [[
███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
					keys = {
						{ icon = " ", key = "f", desc = "Find File", action = ":Telescope find_files" },
						{ icon = " ", key = "r", desc = "Recent Files", action = ":Telescope oldfiles" },
						{ icon = " ", key = "g", desc = "Find Text", action = ":Telescope live_grep" },
						{ icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
						{ icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
						{ icon = " ", key = "q", desc = "Quit", action = ":qa" },
					},
				},
				sections = {
					{ section = "header" },
					{ section = "keys", gap = 1, padding = 1 },
					{ section = "startup" },
				},
			},
		},
		keys = {
			{
				"<leader>gb",
				function()
					Snacks.gitbrowse.open({
						open = function(url)
							vim.fn.setreg("+", url)
							vim.notify("Yanked url to clipboard")
						end,
					})
				end,
				desc = "Git Copy Link",
				mode = { "n", "v" },
			},
			{
				"<leader>z",
				function()
					Snacks.zen()
				end,
				desc = "Zen Mode",
			},
			{
				"<leader>n",
				function()
					Snacks.notifier.hide()
				end,
				desc = "Dismiss Notifications",
			},
		},
	},
}
