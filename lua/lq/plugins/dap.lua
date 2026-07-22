return {
	-- debugger UI + adapters. Python uses debugpy (targets whatever venv is
	-- active - see venv-selector.lua); C/C++ uses codelldb. CUDA device code
	-- can't be debugged here (no NVIDIA GPU on Apple Silicon); codelldb still
	-- debugs the host-side C++ in a .cu file same as any other C++ source.
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
			},
			"theHamsta/nvim-dap-virtual-text",
			"mfussenegger/nvim-dap-python",
			{
				"jay-babu/mason-nvim-dap.nvim",
				dependencies = "mason-org/mason.nvim",
				opts = {
					ensure_installed = { "debugpy", "codelldb" },
					automatic_installation = true,
					handlers = {}, -- use each adapter's default mason-nvim-dap config
				},
			},
		},
		keys = {
			{ "<F5>", function() require("dap").continue() end, desc = "Debug: Continue" },
			{ "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Debug: Toggle Breakpoint" },
			{ "<F10>", function() require("dap").step_over() end, desc = "Debug: Step Over" },
			{ "<F11>", function() require("dap").step_into() end, desc = "Debug: Step Into" },
			{ "<F12>", function() require("dap").step_out() end, desc = "Debug: Step Out" },
			-- <leader>b = "debug/Breakpoint" prefix. (<leader>d is already your
			-- Trouble diagnostics toggle, so debug keys live under b instead.)
			{ "<leader>bb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
			{ "<leader>bc", function() require("dap").continue() end, desc = "Continue" },
			{
				"<leader>bB",
				function() require("dap").set_breakpoint(vim.fn.input("Condition: ")) end,
				desc = "Conditional Breakpoint",
			},
			{ "<leader>br", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
			{ "<leader>bl", function() require("dap").run_last() end, desc = "Run Last" },
			{ "<leader>bu", function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
			{ "<leader>bt", function() require("dap").terminate() end, desc = "Terminate" },
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()
			require("nvim-dap-virtual-text").setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- debugpy: adapter lives in Mason's isolated venv; the target script
			-- runs under $VIRTUAL_ENV's python when set (nvim-dap-python's default
			-- config checks VIRTUAL_ENV itself), else the mason debugpy python.
			local mason_registry = require("mason-registry")
			local debugpy_path = mason_registry.get_package("debugpy"):get_install_path() .. "/venv/bin/python"
			require("dap-python").setup(debugpy_path)

			-- codelldb, for C/C++ (and the host side of .cu files)
			local codelldb_path = mason_registry.get_package("codelldb"):get_install_path()
				.. "/extension/adapter/codelldb"
			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					command = codelldb_path,
					args = { "--port", "${port}" },
				},
			}
			local cpp_config = {
				{
					name = "Launch",
					type = "codelldb",
					request = "launch",
					program = function()
						return vim.fn.input("Executable: ", vim.fn.getcwd() .. "/build/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
					args = {},
				},
			}
			dap.configurations.cpp = cpp_config
			dap.configurations.c = cpp_config
			dap.configurations.cuda = cpp_config
		end,
	},
}
