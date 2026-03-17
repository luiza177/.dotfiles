return {
	"olivercederborg/poimandres.nvim",
	lazy = false,
	priority = 1000,
	enabled = vim.g.theme == "poimandres",
	config = function()
		require("poimandres").setup({
			-- leave this setup function empty for default config
			-- or refer to the configuration section
			-- for configuration options

			-- bold_vert_split = false, -- use bold vertical separators
			-- dim_nc_background = false, -- dim 'non-current' window backgrounds
			-- disable_background = false, -- disable background
			-- disable_float_background = false, -- disable background for floats
			-- disable_italics = false, -- disable italics

			-- TODO: write overrides for EndOfBuffer, WinSeparator, Cokeline, NeoTree Tabs and bg
			-- TODO: override all git highlighting, diff, Lazygit window etc, it sucks
			-- TODO: make comments darker, less contrast
		})
	end,
}
