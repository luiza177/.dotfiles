return {
	"akinsho/bufferline.nvim",
	enabled = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- enabled = false,
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					text_align = "center",
				},
				{
					filetype = "snacks_layout_box",
				},
			},
		},
	},
	config = function(_, opts)
		if vim.g.theme == "catppuccin" then
			opts.highlights = require("catppuccin.special.bufferline").get_theme()
		end
		require("bufferline").setup(opts)
	end,
}
