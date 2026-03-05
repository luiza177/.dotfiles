return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"folke/todo-comments.nvim",
		-- "nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- add to quick list with <Tab> then open quick list
					},
				},
			},
			pickers = {
				buffers = {
					sort_lastused = true,
					sort_mru = true,
					theme = "dropdown",
				},
				old_files = {
					theme = "dropdown",
				},
				help_tags = {
					theme = "ivy",
				},
				keymaps = {
					theme = "ivy",
				},
				git_commits = {
					theme = "ivy",
				},
				git_branches = {
					theme = "ivy",
				},
				command_history = {
					theme = "cursor",
				},
			},
			-- extensions = {
			--   ["ui_select"] = {
			--     require("telescope.themes").get_dropdown()
			--   },
			-- },
		})

		telescope.load_extension("fzf")

		-- KEY MAPPINGS
		local map = vim.keymap.set

		map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Fuzzy find files in cwd" })
		map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Fuzzy find git-tracked files in cwd" })
		map("n", "<leader>fr", "<cmd>Telescope oldfiles<CR>", { desc = "Fuzzy find recent files" })
		map("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", { desc = "Find string in cwd (LiveGrep)" })
		map("n", "<leader>fw", "<cmd>Telescope grep_string<CR>", { desc = "Find string under cursor in cwd" })
		map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Fuzzy find buffers" })
		map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Telescope help tags" })
		map("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
		map("n", "<leader>fc", "<cmd>Telescope command_history<CR>", { desc = "Command history" })
		-- map("n", "<leader>ls", "<cmd>Telescope treesitter<CR>", { desc = "Search treesitter" })
		map(
			"n",
			"<leader>ft",
			"<cmd>TodoTelescope keywords=TODO,FIX,QUESTION<CR>",
			{ desc = "Fuzzy find TODOs in working directory" }
		)
		map(
			"n",
			"<leader>fT",
			"<cmd>TodoTelescope<CR>",
			{ desc = "Fuzzy find all major comments in working directory" }
		)

		map("n", "<leader>gc", "<cmd>Telescope git_commits<CR>", { desc = "Search git commits in Telescope" })
		map("n", "<leader>gb", "<cmd>Telescope git_branches<CR>", { desc = "Search git branches in Telescope" })
	end,
}
