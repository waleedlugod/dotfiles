return {
	"stevearc/conform.nvim",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "isort", "black" },
				javascriptreact = { "prettierd" },
				html = { "djlint" },
				css = { "stylelint" },
				java = { "google-java-format" },
				php = { "php_cs_fixer", "phpcbf" },
			},
		})

		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
