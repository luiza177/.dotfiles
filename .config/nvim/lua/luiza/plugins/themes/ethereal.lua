return {
	"presindent/ethereal.nvim",
	enabled = vim.g.theme == "ethereal",
	opts = {
		-- Options for customization go here.
		-- TODO:  cokeline overrides
	},
	init = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "ethereal",
			callback = function()
				local palette = require("ethereal.palette")
				local set_hl = vim.api.nvim_set_hl

				set_hl(0, "PMenu", { bg = palette.bg1 })
				set_hl(0, "PMenuSbar", { bg = palette.bg1 })
				set_hl(0, "NeoTreeTabActive", { bg = palette.bg0, fg = palette.fg, bold = true })
				set_hl(0, "NeoTreeTabInactive", { bg = palette.bg1, fg = palette.black })
				set_hl(0, "NeoTreeTabSeparatorInactive", { link = "NeoTreeTabInactive" })
				set_hl(0, "NeoTreeTabSeparatorActive", { bg = palette.bg0, fg = palette.black })
			end,
		})
	end,
	config = true,
}
