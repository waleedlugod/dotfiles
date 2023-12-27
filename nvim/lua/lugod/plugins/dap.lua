return {
	"mfussenegger/nvim-dap",
	lazy = true,
	dependencies = {
		"mfussenegger/nvim-dap-python",
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{ '<F5>', function() require("dap").continue() end },
		{ '<F6>', function() require("dap").pause() end },
		{ '<F10>', function() require("dap").step_into() end },
		{ '<F11>', function() require("dap").step_over() end },
		{ '<F12>', function() require("dap").step_out() end },
		{ '<CS-F5>', function() require("dap").restart() end },
		{ '<C-F5>', function() require("dap").terminate() end },
		{ '<Leader>b', function() require("dap").toggle_breakpoint() end },
		{ '<Leader>dd', function() require("dapui").toggle() end, mode = { "n", "v" } },
		{ '<Leader>de', function() require("dapui").eval() end, mode = { "n", "v" } },
	},
	config = function()
		-- Setup python debugger
		if vim.bo.filetype == "python" then
			require("dap-python").setup(vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python")
		end

		-- Setup dap-ui
		require("dapui").setup()
		require("dap").listeners.after.event_initialized["dapui_config"] = function()
			require("dapui").open()
		end

		vim.fn.sign_define("DapBreakpoint", { text = "●" })
	end,
}
