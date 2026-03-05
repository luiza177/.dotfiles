return {
	"RRethy/vim-illuminate",
	enabled = false,
	event = "BufEnter",
	config = function()
		require("illuminate").configure()
	end,
}
