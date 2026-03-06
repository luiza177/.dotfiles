return {
	"lukas-reineke/indent-blankline.nvim",
	event = { "BufEnter", "BufNewFile" },
	enabled = true,
	dependencies = { "HiPhish/rainbow-delimiters.nvim" },
	main = "ibl",
	config = function()
		local hooks = require("ibl.hooks")
		local highlight = {
			"RainbowDelimiterRed",
			"RainbowDelimiterYellow",
			"RainbowDelimiterBlue",
			"RainbowDelimiterOrange",
			"RainbowDelimiterGreen",
			"RainbowDelimiterViolet",
			"RainbowDelimiterCyan",
		}

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- these are set by rainbow-delimiters automatically,
			-- but registering them here ensures they survive colorscheme changes
		end)

		require("ibl").setup({
			indent = { char = "┊" },
			scope = {
				show_exact_scope = true,
				highlight = highlight,
				include = {
					node_type = {
						["*"] = {
							"table_constructor",
							"object",
							"dictionary",
							"block",
							"if_statement",
							"for_statement",
							"while_statement",
							"function_declaration",
							"method_definition",
							"class_declaration",
						},
					},
				},
			},
		})

		hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
	end,
}
