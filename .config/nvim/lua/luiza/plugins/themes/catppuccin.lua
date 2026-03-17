return {
	"catppuccin/nvim",
	name = "catppuccin",
	enabled = vim.g.theme == "catppuccin",
	priority = 1000,
	opts = {
		flavour = "mocha",
		auto_integrations = true,
		integrations = { bufferline = true },
	},
	specs = {
		{
			"akinsho/bufferline.nvim",
			optional = true,
			opts = function(_, opts)
				if (vim.g.colors_name or ""):find("catppuccin") then
					opts.highlights = require("catppuccin.special.bufferline").get_theme()
				end
			end,
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts) -- bufferline overrides

		-- TODO: override EndOfBuffer
	end,
}
