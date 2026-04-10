-- TODO: setup key commands for live-preview, obsidian, etc
-- TODO: install normal markdown.nvim?
-- TODO: configure render-markdown
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
			legacy_commands = false, -- this will be removed in the next major release, Q: still needed?
			workspaces = {
				{
					name = "NOTES",
					path = "~/Dropbox/NOTES/",
				},
			},
		},
	},
}
