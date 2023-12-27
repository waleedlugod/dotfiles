return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()

		-- enable auotcompletion
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- setup Lua server
		-- NOTE:setup neodev before lspconfig
		require("neodev").setup({
			library = { plugins = { "nvim-dap-ui" }, types = true },
		})

		local lspconfig = require("lspconfig")

		-- configure Lua server
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim", "opts" } },
					workspace = { -- Make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})

		-- configure JavaScript/TypeScript server
		lspconfig["eslint"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "json" },
		})

		-- configure CSS server
		lspconfig["cssls"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "json" },
		})

		-- configure Tailwind server
		lspconfig["tailwindcss"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "json" },
		})

		-- configure HTML server
		lspconfig["html"].setup({
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "json" },
		})

		-- configure Java server
		lspconfig["jdtls"].setup({
			capabilities = capabilities,
			filetypes = { "java" },
		})

		-- configure PHP server
		lspconfig["psalm"].setup({
			capabilities = capabilities,
			filetypes = { "php" },
		})

		-- configure Python server
		lspconfig["pyright"].setup({
			capabilities = capabilities,
			filetypes = { "python" },
		})

		-- change diagnostic symbols in the sign column
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				require("telescope")

				-- set keybinds
				vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
				vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
				vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
				vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
				vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
				vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
				vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
				vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})
	end,
}
