return {
	"rebelot/kanagawa.nvim",
	enabled = vim.g.theme == "kanagawa",
	priority = 1000,
	opts = {
		dimInactive = true,
		colors = {
			theme = {
				all = {
					ui = {
						bg_gutter = "none",
					},
				},
			},
		},
	},
}
