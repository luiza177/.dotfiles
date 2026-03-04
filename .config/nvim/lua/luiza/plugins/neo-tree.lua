return {
	"nvim-neo-tree/neo-tree.nvim",
	-- enabled = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons", -- optional, but recommended
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		{ "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		{
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Toggle buffer list in Neotree",
		},
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Toggle Git explorer in Neotree",
		},
	},
	deactivate = function() -- INFO: copied from LazyVim
		vim.cmd([[Neotree close]])
	end,
	-- init = function() -- TODO: add 'init'
	-- end,
	opts = {
		default_component_configs = {
			indent = {
				with_expanders = true,
			},
		},
		source_selector = {
			winbar = true,
			statusline = false,
			-- padding = 2,
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false, -- show dotfiles
				hide_gitignored = false, -- show gitignored files
			},
			follow_current_file = {
				enabled = true, -- highlight current file in tree
			},
		},
		close_if_last_window = true,
		enable_cursor_hijack = true, -- keep cursor on first letter
		window = {
			position = "left",
			width = 35,
			mappings = {
				["l"] = "open",
				["h"] = "close_node",
				["<space>"] = "none",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
				["O"] = {
					function(state)
						require("lazy.util").open(state.tree:get_node().path, { system = true })
					end,
					desc = "Open with System Application",
				},
				["P"] = { "toggle_preview", config = { use_float = false } },
			},
		},
	},
}
