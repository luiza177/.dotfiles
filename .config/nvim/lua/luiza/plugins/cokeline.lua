return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for v0.4.0+
		"nvim-tree/nvim-web-devicons", -- If you want devicons
		-- "stevearc/resession.nvim", -- Optional, for persistent history
	},
	config = function()
		local get_hex = require("cokeline.hlgroups").get_hl_attr

		require("cokeline").setup({
			default_hl = {
				fg = function(buffer)
					return buffer.is_focused and get_hex("Normal", "fg") or get_hex("LineNr", "fg")
				end,
				bg = function(buffer)
					return buffer.is_focused and get_hex("Normal", "bg") or get_hex("WinSeparator", "bg")
					-- return buffer.is_focused and get_hex("CursorLine", "bg") or get_hex("Normal", "bg")
				end,
				-- underline = true,
				-- sp = get_hex("LineNr", "fg"),
			},
			fill_hl = "WinSeparator",
			sidebar = {
				filetype = { "neo-tree" },
				components = {
					{
						text = "              Neo-tree",
						fg = function()
							return get_hex("NeoTreeNormal", "fg")
						end,
						bg = function()
							return get_hex("NeoTreeNormalNC", "bg")
						end,
						bold = function(buffer)
							return buffer.is_focused
						end,
					},
				},
			},
			components = {
				{ -- "▌", "▐", "▏"
					text = function(buffer)
						if buffer.is_focused then
							-- return buffer.is_focused and "▌" or "▏"
							return "▌"
						elseif buffer.index ~= 1 then
							return "▏"
						else
							return "│"
						end
					end,
					fg = function(buffer)
						return buffer.is_focused and get_hex("String", "fg") or get_hex("LineNr", "fg")
					end,
				},
				{
					text = function(buffer)
						return "  " .. buffer.devicon.icon
					end,
					fg = function(buffer)
						return buffer.devicon.color
					end,
				},
				{
					text = function(buffer)
						return buffer.filename .. "  "
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
					italic = function(buffer)
						return buffer.is_modified
					end,
				},
				{
					text = function(buffer)
						return buffer.is_modified and "" or "󰖭"
					end,
					fg = function(buffer)
						if buffer.is_focused then
							if buffer.is_modified then
								return get_hex("String", "fg")
							else
								return get_hex("Normal", "fg")
							end
						else
							return get_hex("LineNr", "fg")
						end
					end,
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end,
				},
				{
					-- text = "  │",
					text = " ▕",
					fg = function()
						return get_hex("LineNr", "fg")
					end,
				},
			},
		})
	end,
}
