return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			-- setup Mason
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					-- install LSPs
					"css-lsp",
					"emmet-ls",
					"eslint-lsp",
					"html-lsp",
					"jdtls",
					"lua-language-server",
					"psalm",
					"pyright",
					"tailwindcss-language-server",
					-- install DAPs
					"debugpy",
					"php-debug-adapter",
					"js-debug-adapter",
					"java-debug-adapter",
					-- install linters/formatters
					"stylua",
					"isort",
					"black",
					"prettierd",
					"djlint",
					"stylelint",
					"google-java-format",
					"php-cs-fixer",
					"phpcbf",
				},
				run_on_start = true,
			})
		end,
	},
}
