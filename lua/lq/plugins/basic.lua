return {
	{
		"rebelot/heirline.nvim",
		event = "BufRead",
		config = function()
			require("lq.configs.heirline")
		end,
	},

	-- session files for tmux-resurrect: run :Obsession once in a project and
	-- Session.vim stays updated, so after a reboot tmux-resurrect relaunches
	-- nvim with your windows/buffers restored (see @resurrect-strategy-nvim
	-- in tmux.conf — dead config without this plugin)
	{
		"tpope/vim-obsession",
		cmd = "Obsession",
	},

	-- seamless window jumps across nvim splits and tmux panes
	{
		"christoomey/vim-tmux-navigator",
		cmd = { "TmuxNavigateLeft", "TmuxNavigateDown", "TmuxNavigateUp", "TmuxNavigateRight" },
		keys = {
			{ "<C-h>", "<cmd>TmuxNavigateLeft<CR>", desc = "Window left" },
			{ "<C-j>", "<cmd>TmuxNavigateDown<CR>", desc = "Window down" },
			{ "<C-k>", "<cmd>TmuxNavigateUp<CR>", desc = "Window up" },
			{ "<C-l>", "<cmd>TmuxNavigateRight<CR>", desc = "Window right" },
		},
	},

	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("lq.configs.gitsigns")
		end,
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require("lq.configs.which-key").setup()
		end,
	},

	-- Terminal
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		config = function()
			require("lq.configs.terminal").setup()
		end,
	},

	-- swith true false
	{
		"Laughing-q/antovim",
		cmd = { "Antovim" },
	},

	-- undotree
	{
		"Laughing-q/undotree",
		cmd = "UndotreeToggle",
	},

	-- faster select
	{
		"sustech-data/wildfire.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		config = true,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = true,
	},

	{
		"lambdalisue/suda.vim",
		cmd = { "SudaWrite", "SudaRead" },
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = { "VimBeGood" },
	},

	{
		"lervag/vimtex",
		ft = { "tex" },
		config = function()
      -- archlinux needs to install texlive-binextra texlive-core texlive-latexextra for latex compiler
			vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_compiler_method = "xelatex"
			-- vim.g.vimtex_compiler_latexmk_engines='xelatex'
		end,
	},
}
