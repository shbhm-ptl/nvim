return {
	-- async formatting, replaces the old blocking `!ruff format %` + `:e!`
	-- reload trick in lq.configs.format (which threw away undo history and
	-- cursor position on every format). <leader>lf and format-on-save both
	-- go through this now; lq.configs.format is kept only as a manual
	-- fallback for filetypes not listed below.
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = "ConformInfo",
		opts = {
			formatters_by_ft = {
				python = { "ruff_organize_imports", "ruff_format" },
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				cuda = { "clang_format" },
				cmake = { "cmake_format" },
				sh = { "shfmt" },
				bash = { "shfmt" },
				json = { "prettier" },
				yaml = { "prettier" },
			},
			formatters = {
				clang_format = { prepend_args = { "--style=Microsoft" } },
				cmake_format = { prepend_args = { "--enable-markup" } },
			},
			format_on_save = {
				timeout_ms = 3000,
				lsp_format = "fallback",
			},
		},
	},
}
