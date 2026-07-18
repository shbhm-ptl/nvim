return {
	-- magit-style git UI: :Neogit for status/stage/commit, diffs via diffview.
	-- gitsigns stays for in-buffer signs/hunks; neogit is the review cockpit
	{
		"NeogitOrg/neogit",
		cmd = "Neogit",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		opts = {},
	},
}
