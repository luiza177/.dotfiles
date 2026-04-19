return {
	"lukas-reineke/virt-column.nvim",
	event = "BufEnter",
	opts = {
		char = "│", -- the line character, not | pipe
		highlight = "VirtColumn",
		virtcolumn = "90",
	},
}
