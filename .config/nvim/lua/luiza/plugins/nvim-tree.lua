return {
	"nvim-tree/nvim-tree.lua",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local nvimtree = require("nvim-tree")

		vim.g.loaded_netrw = 1 --??
		vim.g.loaded_netrwPlugin = 1 --???

		-- close nvim if tree is last window
		vim.api.nvim_create_autocmd("BufEnter", {
			nested = true,
			callback = function()
				-- if vim.fn.winnr("$") == 1 and vim.bo.filetype == "NvimTree" then
				--   vim.cmd("quit")
				-- end
				if #vim.api.nvim_list_wins() == 1 and vim.bo.filetype == "NvimTree" then
					vim.cmd("quit")
				end
			end,
		})

		-- KEYMAPS
		local map = vim.keymap.set

		map("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		-- map("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
		map("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
		map("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
				number = true,
				-- auto_resize = true,
			},
			renderer = {
				-- group_empty = true,
				indent_markers = { enable = true },
			},
			filters = {
				dotfiles = false,
			},
			actions = {
				open_file = {
					window_picker = { enable = false }, -- disable to work well with window splits
				},
			},
			git = {
				enable = true,
				ignore = false,
			},
			update_focused_file = {
				enable = true,
			},
		})
	end,
}
