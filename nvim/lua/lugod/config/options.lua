-- leader
vim.g.mapleader = " "

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- scroll
vim.opt.scrolloff = 8

-- tabs & indentation
-- default indentations
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smartindent = true

-- indentations for web stuff
vim.api.nvim_create_autocmd("FileType", {
	pattern ={ "html", "javascript", "javascriptreact", "css", "php" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

-- line wrap
vim.opt.textwidth = 80
vim.opt.linebreak = true

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- split windows
vim.opt.splitright = true
vim.opt.splitbelow = true

-- current mode
vim.opt.showmode = false

-- terminal
vim.opt.shell = "bash"

-- use undotree as backup system
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.fn.stdpath("data") .. "/undodir"
vim.opt.undofile = true
