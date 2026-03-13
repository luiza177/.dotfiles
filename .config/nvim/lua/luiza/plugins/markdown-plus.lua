return {
	"yousefhadder/markdown-plus.nvim",
	ft = "markdown",
	config = function()
		vim.g.maplocalleader = "\\"
		require("markdown-plus").setup({})
	end,
}
