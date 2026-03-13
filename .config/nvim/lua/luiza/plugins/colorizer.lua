return {
	"NvChad/nvim-colorizer.lua",
	-- enabled = false,
	event = "BufEnter",
	config = true,
	keys = {
		{ "<leader>uc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" }, -- TODO: integrate snacks toggle
	},
	opts = {
		filetypes = {
			"*", -- enable for all filetypes
		},
		user_default_options = {
			-- names = false,  -- disable named colors like "red", "blue"
			RGB = false,
			RRGGBB = true, -- #ff9e64 style
		},
	},
}
