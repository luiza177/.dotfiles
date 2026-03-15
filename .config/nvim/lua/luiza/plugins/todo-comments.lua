return {
	"folke/todo-comments.nvim",
	event = "BufEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		keywords = {
			QUESTION = {
				icon = " ",
				color = "blue",
				alt = { "Q", "Q%?" },
			},
			TODO = { icon = " ", color = "todo" },
			TEST = { icon = "󰙨 " },
			HACK = { icon = "󰣈 " },
			NOTE = { alt = { "INFO" }, color = "info" },
			HINT = { color = "hint", icon = " " },
		},
		colors = {
			todo = { "#fab387" },
			blue = { "#0db9d7" },
		},
		highlight = {
			multiline = false,
		},
	},
	keys = {
		{
			"<leader>fT",
			function()
				Snacks.picker.todo_comments({
					keywords = {
						"TODO",
						"FIX",
						"FIXME",
						"QUESTION",
						"Q",
						"WARN",
						"NOTE",
						"HINT",
						"INFO",
						"TEST",
						"HACK",
					},
				})
			end,
			desc = "Find all annotations",
		},
		{
			"<leader>ft",
			function()
				Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME", "QUESTION", "Q" } })
			end,
			desc = "Todo/Fix/questions",
		},
	},
}
