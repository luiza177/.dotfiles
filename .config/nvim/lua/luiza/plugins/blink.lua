return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" }, -- TODO: add icons with dependencies etc, see https://cmp.saghen.dev/recipes#completion-menu-drawing

	-- use a release tag to download pre-built binaries
	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open --> REMAPPED
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "enter",
			["<M-space>"] = { "show", "show_documentation", "hide_documentation" },
			-- ["<C-e>"] = { "hide", "fallback" },
			-- ["<CR>"] = { "accept", "fallback" },
			["<CR>"] = { "accept", "cancel", "fallback" },
			--
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			--
			-- ["<Up>"] = { "select_prev", "fallback" },
			-- ["<Down>"] = { "select_next", "fallback" },
			-- ["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			-- ["<C-n>"] = { "select_next", "fallback_to_mappings" },
			--
			-- ["<C-b>"] = { "scroll_documentation_up", "fallback" },
			-- ["<C-f>"] = { "scroll_documentation_down", "fallback" },
			--
			-- ["<C-u>"] = { "scroll_signature_up", "fallback" },
			-- ["<C-d>"] = { "scroll_signature_down", "fallback" },
			["<C-j>"] = { "select_next", "fallback" }, -- QUESTION: or fallback_to_mappings?
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-l>"] = { "show_documentation", "hide_documentation", "fallback" },
			["<C-d>"] = { "show_documentation", "hide_documentation", "fallback" },

			["<C-b>"] = { "scroll_documentation_up", "scroll_signature_up", "fallback" },
			["<C-n>"] = { "scroll_documentation_down", "scroll_signature_down", "fallback" },
			["<C-u>"] = {},
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- Signature help
		signature = {
			enabled = true,
			window = {
				border = require("luiza.core.borders").border_chars_outer_thin,
			},
		},

		-- (Default) Only show the documentation popup when manually triggered -- CHANGED
		completion = {
			menu = {
				-- TODO: disable completion in comments and strings
				-- auto_show = function() end,
				-- TODO: Border color in addition to outer
				border = require("luiza.core.borders").border_chars_outer_thin,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					border = require("luiza.core.borders").border_chars_outer_thin,
				},
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = true,
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
