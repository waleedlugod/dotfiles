return {
	"gelguy/wilder.nvim",
	event = "VeryLazy",
	config = function()
		local wilder = require("wilder")
		wilder.setup({ modes = { ":", "/", "?" } })
		local mocha = require("catppuccin.palettes").get_palette "mocha"

		wilder.set_option("renderer", wilder.popupmenu_renderer(
			wilder.popupmenu_border_theme({
				highlighter = wilder.basic_highlighter(),
				highlights = {
					accent = wilder.make_hl(
						"Accent",
						{{ a = 1 }, { a = 1 }, { foreground = mocha.red }}
					),
					default = wilder.make_hl(
						"Background",
						{{ a = 1 }, { a = 1 }, { background = mocha.base }}
					),
				},
				border = "rounded",
				right = {
					" ",
					wilder.popupmenu_scrollbar({
						scrollbar_hl = wilder.make_hl(
							"Scrollbar",
							{{ a = 1 }, { a = 1 }, { background = mocha.base }}
						)
					}),
				},
			})
		))
	end,
}
