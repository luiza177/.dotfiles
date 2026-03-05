return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	-- event = "VimEnter",
	config = function()
		local wk = require("which-key")

		wk.setup({
			delay = 500,
			plugins = {
				marks = false, -- shows a list of your marks on ' and `
				registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
				-- the presets plugin, adds help for a bunch of default keybindings in Neovim
				-- No actual key bindings are created
				spelling = {
					enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
					suggestions = 20, -- how many suggestions should be shown in the list?
				},
				presets = {
					operators = false, -- adds help for operators like d, y, ...
					motions = false, -- adds help for motions
					text_objects = false, -- help for text objects triggered after entering an operator
					windows = false, -- default bindings on <c-w>
					nav = false, -- misc bindings to work with windows
					z = true, -- bindings for folds, spelling and others prefixed with z
					g = false, -- bindings for prefixed with g
				},
			},
		})

		wk.add({
			-- register key group names
			{ "<leader>e", group = "explorer", icon = "󰙅" },
			{ "<leader>f", group = "find" },
			{ "<leader>s", group = "split", icon = "" },
			{ "<leader>t", group = "tab" },
			{ "<leader>x", group = "trouble", icon = "" },
			{ "<leader>u", group = "ui" },
			{ "<leader>b", group = "buffer", icon = "" },
			{ "<leader>d", group = "diagnostics" },
			{ "<leader>l", group = "lsp", icon = "" }, -- QUESTION: change all to 'code'??
			{ "<leader>c", group = "code" },
			{ "<leader>r", group = "replace", icon = "" },
			{ "<leader>g", group = "git" },

			{ "<leader>L", desc = "Open Lazy package manager", icon = "" },
			{ "<leader>M", desc = "Open Mason", icon = "" },

			--------------- NORMAL VIM KEYS
			-- g prefix
			-- { "g", group = "goto/comment" },
			-- { "gg", desc = "Go to top of file" },
			-- { "G", desc = "Go to bottom of file" },
			-- { "ge", desc = "Go to end of previous word" },
			-- { "gf", desc = "Go to file under cursor" },
			-- { "g;", desc = "Go to last edit position" },
			-- { "gc", desc = "Toggle comment (operator)" },
			-- { "gcc", desc = "Toggle comment line" },

			-- z prefix
			{ "z", group = "folds/view", icon = "" },
			{ "za", desc = "Toggle fold" },
			{ "zo", desc = "Open fold", icon = "" },
			{ "zc", desc = "Close fold", icon = "" },
			{ "zR", desc = "Open all folds", icon = "" },
			{ "zM", desc = "Close all folds", icon = "󰄾" },
			{ "zz", desc = "Center cursor", icon = "󰘢" },
			{ "zt", desc = "Cursor to top of screen", icon = "󰘣" },
			{ "zb", desc = "Cursor to bottom of screen", icon = "" },
			{ "z=", desc = "Spelling suggestions", icon = "" },

			-- [ and ] navigation
			{ "[", group = "prev", icon = "󰒮" },
			{ "]", group = "next", icon = "󰒭" },
			-- { "[d", desc = "Prev diagnostic" },
			-- { "]d", desc = "Next diagnostic" },
			-- { "[c", desc = "Prev git hunk" },
			-- { "]c", desc = "Next git hunk" },
			{ "[[", desc = "Prev function/class", icon = "󰊕" },
			{ "]]", desc = "Next function/class", icon = "󰊕" },

			-- surround
			{ "ys", desc = "Add surrounding", icon = "+" },
			{ "ds", desc = "Delete surrounding", icon = "-" },
			{ "cs", desc = "Change surrounding", icon = "" },
			{ "S", desc = "Surround selection", mode = "󰒉" },

			-- text objects (visual reference)
			-- { "y", group = "yank" },
			-- { "yiw", desc = "Yank inner word" },
			-- { "yaw", desc = "Yank around word" },
			-- { 'yi"', desc = "Yank inner quotes" },
			-- { 'ya"', desc = "Yank around quotes" },
			-- { "yi(", desc = "Yank inner parens" },
			-- { "ya(", desc = "Yank around parens" },
			-- { "yif", desc = "Yank inner function" },
			-- { "yaf", desc = "Yank around function" },

			-- Ctrl prefixed
			-- { "<C-d>", desc = "Scroll down" },
			-- { "<C-u>", desc = "Scroll up" },
			-- { "<C-o>", desc = "Jump back" },
			-- { "<C-i>", desc = "Jump forward" },
			-- { "<C-^>", desc = "Alternate buffer" },

			-- misc
			{ "%", desc = "Jump to matching pair" },
			{ "@:", desc = "Repeat last command", icon = "" },
		})
	end,
}
