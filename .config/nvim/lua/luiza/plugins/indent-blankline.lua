return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufEnter", "BufNewFile" },
	enabled = false,
	main = "ibl",
	opts = {
		indent = { char = "┊" },
	},
}
