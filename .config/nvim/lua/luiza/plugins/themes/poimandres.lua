return {
	"olivercederborg/poimandres.nvim",
	lazy = false,
	priority = 1000,
	enabled = vim.g.theme == "poimandres",
	init = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "poimandres",
			callback = function()
				local set_hl = vim.api.nvim_set_hl

				set_hl(0, "EndOfBuffer", { bg = "#303340" })
				set_hl(0, "NeoTreeWinSeparator", { fg = "#171922" })
				set_hl(0, "Comment", { link = "LineNr", italic = true }) -- FIXME: why no italic?
				set_hl(0, "FloatBorder", { link = "FloatTitle" }) -- TODO: only the pickers
				--MatchParen for active border
				set_hl(0, "NeoTreeNormal", { bg = "#171922" })
				set_hl(0, "NeoTreeNormalNC", { bg = "#171922" })
				set_hl(0, "NeoTreeTabActive", { bg = "#171922" })
				-- set_hl(0, "NeoTreeTabSeparatorActive", { bg = "#171922" })
				-- set_hl(0, "NeoTreeTabInactive", { bg = "" })
				-- set_hl(0, "NeoTreeTabSeparatorInactive", { bg = "" })
			end,
		})
	end,
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

			-- TODO: override all git highlighting, diff, Lazygit window etc, it sucks
			-- TODO: make comments darker, less contrast
		})
	end,
}
