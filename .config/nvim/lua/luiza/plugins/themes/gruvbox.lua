return {
	"ellisonleao/gruvbox.nvim",
	enabled = vim.g.theme == "gruvbox",
	priority = 1000,
	config = true,
	opts = {
		overrides = {
			-- SignColumn = { bg = "#282828" }, -- dark0

			EndOfBuffer = { fg = "#3c3836" }, -- dark1
			-- NeoTreeEndOfBuffer = { fg = "#3c3836" }, -- dark1

			MatchParen = { link = "GruvBoxGreenBold" },

			-- NeoTreeTabInactive = { bg = "#504945" }, --dark2
			-- NeoTreeTabSeparatorInactive = { bg = "#504945" }, --dark2
			NeoTreeTabInactive = { bg = "#3c3836" }, -- dark1
			NeoTreeTabSeparatorInactive = { bg = "#3c3836" }, --dark1

			-- TODO: invert for all themes
			DiagnosticVirtualTextError = { link = "ErrorMsg" }, -- TODO: change fg to lighter red or something
			DiagnosticVirtualTextWarn = { link = "WarningMsg" },
			-- DiagnosticVirtualTextHint = {""},
			-- DiagnosticVirtualTextOk = { ""},
			-- DiagnosticVirtualTextInfo = { ""},

			-- WarningMessage = { bg = "GruvBoxGreenBold" }
		},
	},
}
