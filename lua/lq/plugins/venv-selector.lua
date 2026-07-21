return {
	-- pick a project's Python interpreter (uv/venv/conda) from inside nvim;
	-- sets $VIRTUAL_ENV and restarts pyright/ruff so they see the right one.
	-- heirline's statusline already reads $VIRTUAL_ENV (see heirline/components.lua)
	{
		"linux-cultist/venv-selector.nvim",
		branch = "regexp", -- current stable branch (main is a WIP rewrite)
		cmd = "VenvSelect",
		dependencies = { "nvim-telescope/telescope.nvim" },
		keys = {
			{ "<leader>lv", "<cmd>VenvSelect<CR>", desc = "Select venv" },
		},
		opts = {
			search = {
				-- uv puts project venvs in `.venv` at the project root by default
				cwd = { command = "fd '/bin/python$' .venv --full-path --color never -E /proc" },
			},
		},
	},
}
