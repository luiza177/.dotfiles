return {
	"doctorfree/cheatsheet.nvim",
	enabled = false,
	event = "VeryLazy",
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	config = function()
		-- local ctactions = require("cheatsheet.telescope.actions")
		require("cheatsheet").setup({
			bundled_cheatsheets = {
				enabled = { "default", "lua", "markdown", "regex", "netrw", "nerd-fonts" },
				disabled = { "unicode" },
			},
			bundled_plugin_cheatsheets = {
				enabled = { "gitsigns" },
				disabled = {
					"auto-session",
					"goto-preview",
					"octo.nvim",
					"telescope.nvim",
					"vim-easy-align",
					"vim-sandwich",
				},
			},
			include_only_installed_plugins = true,
			-- telescope_mappings = {
			-- 	["<CR>"] = ctactions.select_or_fill_commandline,
			-- 	["<A-CR>"] = ctactions.select_or_execute,
			-- 	["<C-Y>"] = ctactions.copy_cheat_value,
			-- 	["<C-E>"] = ctactions.edit_user_cheatsheet,
			-- },
		})
	end,
}
