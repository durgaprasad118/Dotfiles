return {
	"mfussenegger/nvim-dap",
	event = "BufRead",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
		"nvim-telescope/telescope-dap.nvim",
		"leoluz/nvim-dap-go", -- correct dap-go dependency
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local virtual_text = require("nvim-dap-virtual-text")
		local dap_go = require("dap-go")

		-- Setup LLDB adapter for Rust debugging
		dap.adapters.lldb = {
			type = "executable",
			command = "/opt/homebrew/opt/llvm/bin/lldb-vscode", -- adjust as needed, must be absolute path
			name = "lldb",
		}

		local lldb = {
			name = "Launch lldb",
			type = "lldb", -- matches the adapter
			request = "launch", -- could also attach to a currently running process
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopOnEntry = false,
			args = {},
			runInTerminal = false,
		}

		-- Rust configuration using LLDB
		dap.configurations.rust = { lldb }

		-- Setup DAP UI, virtual text, and Go adapter
		dapui.setup()
		virtual_text.setup()
		dap_go.setup()

		-- Keybindings for DAP (optional)
		local keymap = vim.keymap -- for conciseness
		keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Start/Continue Debugging" })
		keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Step Over" })
		keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Step Into" })
		keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Step Out" })
		keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Toggle Breakpoint" })
		keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl_open()<CR>", { desc = "Open REPL" })
		keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { desc = "Toggle DAP UI" })
	end,
}
