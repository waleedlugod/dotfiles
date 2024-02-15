return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = { "BufReadPre", "BufNewFile", },
	cmd = { "TodoTelescope" },
	keys = {
		{ "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
		{ "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
		{ "<leader>xt", "<cmd>TodoTelescope<cr>", desc = "Todo (Telesscope)" },
	},
	opts = {}
}
