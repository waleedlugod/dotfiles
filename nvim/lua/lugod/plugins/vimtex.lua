return {
	"lervag/vimtex",
	config = function()
		if vim.fn.has('win32') or (vim.fn.has('unix') and vim.fn.exists('$WSLENV')) then
			if vim.fn.executable('sioyek.exe') then
				vim.g.vimtex_view_method = 'sioyek'
				vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
				vim.g.vimtex_callback_progpath = 'wsl nvim'
			elseif vim.fn.executable('mupdf.exe') then
				vim.g.vimtex_view_general_viewer = 'mupdf.exe'
			elseif vim.fn.executable('SumatraPDF.exe') then
				vim.g.vimtex_view_general_viewer = 'Su:matraPDF.exe'
			end
		end
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
