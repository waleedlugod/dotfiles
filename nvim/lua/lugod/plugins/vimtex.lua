return {
	"lervag/vimtex",
	config = function()
		vim.g.vimtex_view_method = "zathura"

		-- this is for latex minted plugin to work
		vim.g.vimtex_compiler_latexmk = {
			options = {
				'-shell-escape',
				'-verbose',
				'-file-line-error',
				'-synctex=1',
				'-interaction=nonstopmode'
			}
		}
	end
}
