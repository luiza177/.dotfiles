return {
	"mikesmithgh/borderline.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("borderline").setup({
			--  ...
		})
	end,
}
