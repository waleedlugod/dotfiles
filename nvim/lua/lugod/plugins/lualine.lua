return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local colors = require("catppuccin.palettes").get_palette "mocha"

		return {
			options = {
				theme = {
                    normal = {
                        a = { fg = colors.blue, bg = nil },
                        b = { fg = colors.sky, bg = nil },
                        c = { fg = colors.text, bg = nil },
						x = { fg = nil, bg = nil },
                        y = { fg = colors.text, bg = nil },
                        z = { fg = colors.sky, bg = nil },
                    },
                    insert = {
                        a = { fg = colors.green, bg = nil },
                        z = { fg = colors.sky, bg = nil },
                    },
                    visual = {
                        a = { fg = colors.mauve, bg = nil },
                        z = { fg = colors.sky, bg = nil },
                    },
                    replace = {
                        a = { fg = colors.red, bg = nil },
                        z = { fg = colors.sky, bg = nil },
                    },
                },
				globalstatus = true,
				component_separators = "",
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "branch", icon = "" }, },
				lualine_c = {
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						path = 1,
						symbols = { modified = "  ", readonly = "", unnamed = "" },
					},
				},
				lualine_x = {},
				lualine_y = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
					{ "diff" },
					{ "diagnostics" },
				},
				lualine_z = {
					{ "progress", color = { fg = colors.mauve, bg = nil } },
					{ "location", padding = { left = 0, right = 1 } },
				},
			},
		}
	end,
}
