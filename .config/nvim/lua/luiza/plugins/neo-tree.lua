return {
	"nvim-neo-tree/neo-tree.nvim",
	-- enabled = false,
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
			"<leader>be",
			function()
				require("neo-tree.command").execute({ source = "buffers", toggle = true })
			end,
			desc = "Toggle buffer list in Neotree",
		},
		{
			"<leader>ge",
			function()
				require("neo-tree.command").execute({ source = "git_status", toggle = true })
			end,
			desc = "Toggle Git explorer in Neotree",
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
		source_selector = {
			winbar = true,
			statusline = false,
		},
		filesystem = {
			bind_to_cwd = true,
			use_libuv_file_watcher = true,
			cwd_target = { -- QUESTION: did I do this right? look up property better
				sidebar = "global", -- sets new cwd for vim, as if using cd
				current = "global",
			},
			filtered_items = {
				visible = true,
				hide_dotfiles = false, -- show dotfiles
				hide_gitignored = false, -- show gitignored files
			},
			follow_current_file = {
				enabled = true, -- highlight current file in tree
			},
		},
		close_if_last_window = true,
		enable_cursor_hijack = true, -- keep cursor on first letter
		window = {
			auto_close = true, -- close when a file is picked -- FIXME: doesn't work
			position = "left",
			width = 35,
			mappings = {
				["."] = "set_root", -- QUESTION: add lsp root?
				-- ["."] = {
				-- 	function(state)
				-- 		local node = state.tree:get_node()
				-- 		local path = node.type == "directory" and node:get_id()
				-- 			or vim.fn.fnamemodify(node:get_id(), ":h")
				-- 		-- call the built-in set_root action
				-- 		require("neo-tree.sources.filesystem.commands").set_root(state)
				-- 		vim.cmd("cd " .. path)
				-- 		vim.cmd("LspRestart")
				-- 	end,
				-- 	desc = "Set root, cwd, and restart LSP",
				-- },
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
	config = function(_, opts) -- TODO: add snacks rename stuff
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
