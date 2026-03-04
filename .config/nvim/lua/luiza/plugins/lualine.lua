return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		lualine.setup({
			options = {
				theme = "auto",
				globalstatus = false,
				section_separators = "",
				component_separators = "",
			},
			sections = {
				--lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				--lualine_c = { "filename" },
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "diagnostics" },
					{ "filetype" },
				},
				--lualine_y = { "filetype" },
				--lualine_z = { "progress", "location" },
			},
		})
	end,
}
