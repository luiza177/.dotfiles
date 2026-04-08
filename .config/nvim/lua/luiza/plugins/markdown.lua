return {
	{
		"yousefhadder/markdown-plus.nvim",
		ft = "markdown",
		config = function()
			vim.g.maplocalleader = "\\"
			require("markdown-plus").setup({})
		end,
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {},
	},
	{
		"brianhuster/live-preview.nvim",
		dependencies = {
			"folke/snacks.nvim",
		},
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*",
		opts = {
			legacy_commands = false, -- this will be removed in the next major release
			workspaces = {
				{
					name = "NOTES",
					path = "~/Dropbox/NOTES/",
				},
			},
		},
	},
}
