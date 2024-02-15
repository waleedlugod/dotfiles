return {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			show_end_of_buffer = true,
			term_colors = true,
			transparent_background = true,
			integrations = {
				cmp = true,
				nvimtree = true,
				treesitter = true,
				telescope = { enabled = true },
				leap = true,
				mason = true,
				dap = true,
				dap_ui = true,
				native_lsp = { enabled = true },
				rainbow_delimiters = true,
				markdown = true,
			},
		})
		vim.cmd.colorscheme "catppuccin"
	end,
}
