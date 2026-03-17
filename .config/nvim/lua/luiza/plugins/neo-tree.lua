return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false, -- neo-tree will lazily load itself
	keys = {
		{ "<leader>ee", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		{ "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
		{
			"<leader>eb",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Toggle buffer list in Neotree",
		},
		{
			"<leader>es",
			function()
				require("neo-tree.command").execute({ source = "document_symbols", toggle = true })
			end,
			desc = "Toggle Document Symbols in Neotree",
		},
	},
	deactivate = function() -- INFO: copied from LazyVim
		vim.cmd([[Neotree close]])
	end,
	init = function() -- WARN: copied from LazyVim, untested
		-- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it, because `cwd` is not set up properly.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true,
			callback = function()
				if package.loaded["neo-tree"] then
					return
				else
					local stats = vim.uv.fs_stat(vim.fn.argv(0))
					if stats and stats.type == "directory" then
						require("neo-tree")
					end
				end
			end,
		})
	end,
	opts = {
		default_component_configs = {
			indent = {
				with_expanders = true,
			},
			git_status = {
				symbols = {
					ignored = "-",
				},
			},
		},
		sources = { "filesystem", "buffers", "document_symbols" },
		source_selector = {
			winbar = true, -- QUESTION: keep?
			statusline = false,
			sources = {
				{
					source = "filesystem", -- string
					display_name = " 󰉓 Files ", -- string | nil
				},
				{
					source = "buffers", -- string
					display_name = " 󰈚 Buffers ", -- string | nil
				},
				{
					source = "document_symbols",
					display_name = "  Symbols ",
				},
			},
		},
		filesystem = {
			bind_to_cwd = true,
			use_libuv_file_watcher = true,
			cwd_target = {
				sidebar = "global", -- sets new cwd for vim, as if using cd
				current = "global",
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false, -- show dotfiles
				hide_gitignored = false, -- show gitignored files
				never_show = {
					".DS_Store",
				},
			},
			follow_current_file = {
				enabled = true, -- highlight current file in tree
			},
		},
		close_if_last_window = true,
		enable_cursor_hijack = true, -- keep cursor on first letter
		window = {
			position = "left",
			width = 35,
			mappings = {
				["."] = "set_root", -- QUESTION: add lsp root?
				["l"] = "open",
				["h"] = "close_node",
				["<space>"] = "none",
				["Y"] = {
					function(state)
						local node = state.tree:get_node()
						local path = node:get_id()
						vim.fn.setreg("+", path, "c")
					end,
					desc = "Copy Path to Clipboard",
				},
				["P"] = { "toggle_preview", config = { use_float = true } },
			},
		},
	},
	config = function(_, opts)
		local function on_move(data)
			Snacks.rename.on_rename_file(data.source, data.destination)
		end

		local events = require("neo-tree.events")
		opts.event_handlers = opts.event_handlers or {}
		vim.list_extend(opts.event_handlers, {
			{ event = events.FILE_MOVED, handler = on_move },
			{ event = events.FILE_RENAMED, handler = on_move },
			{
				event = events.FILE_OPENED,
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		})
		require("neo-tree").setup(opts)
	end,
}
