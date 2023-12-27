return {
	"tamton-aquib/duck.nvim",
	keys = {
		{ "<leader>duck", function() require("duck").hatch() end, {} },
		{ "<leader>cook", function() require("duck").cook() end, {} },
	}
}
