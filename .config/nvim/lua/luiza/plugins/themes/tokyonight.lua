return {
	"folke/tokyonight.nvim",
	enabled = vim.g.theme == "tokyonight",
	priority = 1000,
	opts = {
		style = "night",
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
	end,
}
