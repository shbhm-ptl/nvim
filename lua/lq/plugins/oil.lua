return {
	-- edit the file system like a normal buffer: rename/move/delete files by
	-- editing text, then :w to apply. Complements yazi (R) which is a full
	-- file-manager UI; oil is for quick in-place tweaks
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		keys = {
			-- "-" to open parent dir is oil's documented standard mapping
			-- (stock "-" = cursor up one line, redundant with "k")
			{ "-", "<cmd>Oil<CR>", desc = "Open parent directory (oil)" },
		},
		opts = {
			view_options = { show_hidden = true },
		},
	},
}
