return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"L3MON4D3/LuaSnip",
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			build = "make install_jsregexp", -- install jsregexp (optional!).
		},
		"saadparwaiz1/cmp_luasnip",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim", -- vscode-like pictograms
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			enabled = function()
				local context = require("cmp.config.context")
				-- disable in comments
				if context.in_treesitter_capture("comment") then
					return false
				end
				-- disable in strings
				-- if context.in_treesitter_capture("string") then
				-- 	return false
				-- end
				return true
			end,
			completion = {
				-- INFO: 'menu'     = Show completions in a popup menu (only when 2+ items exist)
				--       'menuone'  = Show the popup even when there's only 1 match
				--       'preview'  = Show extra info (docs) in the preview/split window above
				--       'noselect' = Don't auto-select the first item — cursor sits above the list
				--       'noinsert' = Don't insert text until you explicitly confirm (pairs well with "noselect")
				completeopt = "menu,menuone,preview,noselect,noinsert",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<M-space>"] = cmp.mapping.complete(), -- show completion suggestions, originally <C-Space>
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<Esc>"] = cmp.mapping(function(fallback)
					-- if cmp.visible() then
					-- cmp.abort()
					-- else
					fallback()
					-- end
				end),
				-- ["<CR>"] = cmp.mapping.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace }), -- NOTE: test true, but first noselect
				["<CR>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if cmp.get_selected_entry() then
							cmp.confirm({ select = false, behavior = cmp.ConfirmBehavior.Replace })
						else
							cmp.abort()
						end
					else
						fallback()
					end
				end),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
					show_labelDetails = true, -- if available in LSP
					-- menu = {
					--   nvim_lsp = "[LSP]",
					--   luasnip = "[Snip]",
					--   buffer = "[Buf]",
					--   path = "[Path]",
					-- }
				}),
			},
			window = {
				completion = cmp.config.window.bordered({
					border = "single", -- can be "single", "double", "rounded", "shadow", "none" or custom array (clockwise from top-left)
					-- scrollbar = false,
					-- winhighlight = "Normal:CmpNormal,CursorLine:CmpSel,Search:None",
					-- scrolloff = 0,
					-- col_offset = 0,
					-- side_padding = 1,
				}),
				documentation = cmp.config.window.bordered({
					border = "double", -- can be "single", "double", "rounded", "shadow" or "none"
					-- winhighlight = "Normal:CmpDoc"
				}),
			},
			-- performance = {
			--      debounce = 60,          -- ms to wait before triggering (default 60)
			--      throttle = 30,          -- ms between updates
			--      fetching_timeout = 500, -- ms before giving up on a source
			--      max_view_entries = 20,
			--    },
		})
	end,
}
