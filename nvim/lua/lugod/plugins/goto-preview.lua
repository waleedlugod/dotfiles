return {
	'rmagatti/goto-preview',
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require('goto-preview').setup {
			default_mappings = true;
		}
	end
}
