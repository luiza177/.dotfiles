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

		-- -- bufferline overrides
		-- if opts.flavour == "macchiato" then
		-- 	vim.api.nvim_set_hl(
		-- 		0,
		-- 		"BufferLineBufferSelected",
		-- 		{ fg = "#cad3f5", bg = "#24273a", bold = true, italic = true }
		-- 	)
		-- 	vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#8087a2", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineBuffer", { fg = "#8087a2", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#181926" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "#8087a2", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#c6a0f6", bg = "#24273a" }) -- catppuccin mauve
		-- 	vim.api.nvim_set_hl(0, "BufferLineIndicatorVisible", { fg = "#1e2030", bg = "#1e2030" }) -- hidden
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { fg = "#cad3f5", bg = "#24273a" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { fg = "#8087a2", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButton", { fg = "#8087a2", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = "#a6da95", bg = "#24273a" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { fg = "#a6da95", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#a6da95", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#181926", bg = "#1e2030" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "#181926", bg = "#24273a" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { fg = "#181926", bg = "#1e2030" })
		-- elseif opts.flavour == "mocha" then
		-- 	vim.api.nvim_set_hl(
		-- 		0,
		-- 		"BufferLineBufferSelected",
		-- 		{ fg = "#cdd6f4", bg = "#1e1e2e", bold = true, italic = true }
		-- 	)
		-- 	vim.api.nvim_set_hl(0, "BufferLineBufferVisible", { fg = "#6c7086", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineBuffer", { fg = "#6c7086", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineFill", { bg = "#11111b" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineBackground", { fg = "#6c7086", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineIndicatorSelected", { fg = "#cba6f7", bg = "#1e1e2e" }) -- mocha mauve
		-- 	vim.api.nvim_set_hl(0, "BufferLineIndicatorVisible", { fg = "#181825", bg = "#181825" }) -- hidden
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButtonSelected", { fg = "#cdd6f4", bg = "#1e1e2e" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButtonVisible", { fg = "#6c7086", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineCloseButton", { fg = "#6c7086", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModifiedSelected", { fg = "#a6e3a1", bg = "#1e1e2e" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModifiedVisible", { fg = "#a6e3a1", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineModified", { fg = "#a6e3a1", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparator", { fg = "#11111b", bg = "#181825" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparatorSelected", { fg = "#11111b", bg = "#1e1e2e" })
		-- 	vim.api.nvim_set_hl(0, "BufferLineSeparatorVisible", { fg = "#11111b", bg = "#181825" })
		-- end
	end,
}
