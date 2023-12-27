return {
	"nvim-telescope/telescope.nvim",
	tag = '0.1.4',
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>" },
		{ "<leader>xx", "<cmd>Telescope diagnostics<CR>" },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--type",
						"f",
						"--follow",
						"--hidden",
						"--exclude",
						".git",
						"--strip-cwd-prefix" }
					},
				},
			})
			require("telescope").load_extension("fzf")
		end,
	}
