return {
	"ellisonleao/gruvbox.nvim",
	enabled = vim.g.theme == "gruvbox",
	priority = 1000,
	config = true,
	opts = {
		overrides = {
			-- SignColumn = { bg = "#282828" }, -- dark0

			-- EndOfBuffer = { fg = "#282828" }, -- dark0
			EndOfBuffer = { fg = "#3c3836" }, -- dark1
			-- NeoTreeEndOfBuffer = { fg = "#3c3836" }, -- dark1

			-- NeoTreeWinSeparator = { bg = "#3c3836", fg = "#3c3836" }, -- dark1
			-- NeoTreeNormal = { bg = "#3c3836" }, --dark1
			-- NeoTreeNormalNC = { bg = "#3c3836" }, --dark1

			-- NeoTreeTabActive = { bg = "#3c3836", bold = true }, --dark1
			-- NeoTreeTabSeparatorActive = { bg = "#3c3836" }, --dark1

			NeoTreeTabInactive = { fg = "#504945" }, --dark2
			NeoTreeTabSeparatorInactive = { fg = "#504945" }, --dark2
			-- NeoTreeTabInactive = { bg = "#282828" }, -- dark0
			-- NeoTreeTabSeparatorInactive = { bg = "#282828" }, --dark0
			-- NeoTreeTabInactive = { bg = "#1d2021" }, -- dark0_hard
			-- NeoTreeTabSeparatorInactive = { bg = "#1d2021" }, --dark0_hard
		},
	},
}
