return {
	"kylechui/nvim-surround",
	event = "VeryLazy",
	config = function()
		require("nvim-surround").setup()

		vim.g.nvim_surround_no_normal_mappings = true

		vim.keymap.set("n", "sa", "<Plug>(nvim-surround-normal)", { desc = "Surround add" })
		vim.keymap.set("n", "sA", "<Plug>(nvim-surround-normal-line)", { desc = "Surround add (line)" })
		vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)", { desc = "Surround delete" })
		vim.keymap.set("n", "sr", "<Plug>(nvim-surround-change)", { desc = "Surround change" })
		vim.keymap.set("x", "sa", "<Plug>(nvim-surround-visual)", { desc = "Surround add (visual)" })
	end,
}
