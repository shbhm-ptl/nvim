return {
	-- configure/build/run/debug a CMake project (typical for CUDA C++) from
	-- inside nvim. -DCMAKE_EXPORT_COMPILE_COMMANDS=ON is the important part:
	-- clangd reads that file for real include paths/flags instead of guessing.
	{
		"Civitasv/cmake-tools.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
		cmd = { "CMakeGenerate", "CMakeBuild", "CMakeRun", "CMakeDebug", "CMakeSelectBuildType" },
		keys = {
			{ "<leader>cg", "<cmd>CMakeGenerate<CR>", desc = "CMake Generate" },
			{ "<leader>cb", "<cmd>CMakeBuild<CR>", desc = "CMake Build" },
			{ "<leader>cr", "<cmd>CMakeRun<CR>", desc = "CMake Run" },
			{ "<leader>cd", "<cmd>CMakeDebug<CR>", desc = "CMake Debug" },
			{ "<leader>ct", "<cmd>CMakeSelectBuildType<CR>", desc = "CMake Build Type" },
		},
		opts = {
			cmake_build_directory = "build",
			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=ON" },
		},
	},
}
