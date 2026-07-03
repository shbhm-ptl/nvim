return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"mason-org/mason.nvim",
				config = function()
					require("lq.configs.lsp.mason")
				end,
			},
		},
		event = "VeryLazy",
		config = function()
			require("lq.configs.lsp.lspconfig")
			vim.cmd("silent! do FileType")
		end,
	},
}
