return {
	"ggandor/leap.nvim",
	config = function()
		require("leap").add_default_mappings()

		-- HACK: workaround to hide duplicate cursor https://github.com/ggandor/leap.nvim/issues/70
		vim.api.nvim_create_autocmd(
		  "User",
		  { callback = function()
			  vim.cmd.hi("Cursor", "blend=100")
			  vim.opt.guicursor:append { "a:Cursor/lCursor" }
			end,
			pattern = "LeapEnter"
		  }
		)
		vim.api.nvim_create_autocmd(
		  "User",
		  { callback = function()
			  vim.cmd.hi("Cursor", "blend=0")
			  vim.opt.guicursor:remove { "a:Cursor/lCursor" }
			end,
			pattern = "LeapLeave"
		  }
		)
	end
}
