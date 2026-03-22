return {
	"RRethy/vim-illuminate",
	enabled = true,
	event = "BufEnter",
	config = function()
		require("illuminate").configure()
	end,
}
