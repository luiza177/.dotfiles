return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	enabled = false,
	-- opts = function(_, opts)
	-- 	if vim.g.theme == "catppuccin" then
	-- 		opts.highlights = require("catppuccin.special.bufferline").get_theme()
	-- 	end
	-- end,
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			offsets = {
				{
					filetype = "neo-tree",
					-- filetype = "nvim-tree",
					text = "Neo-tree",
					-- text = "Nvim-tree",
					highlight = "Directory",
					text_align = "center",
					-- text_align = "left",
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
