return {
	"tyru/open-browser.vim",
	keys = {
		{ "gx", "<Plug>(openbrowser-smart-search)", mode = { "n", "v" } }
	},
	config = function()
		-- disable netrw's gx mapping.
		vim.g.netrw_nogx = 1
	end,
}
