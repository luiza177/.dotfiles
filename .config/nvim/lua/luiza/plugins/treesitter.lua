return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	build = ":TSUpdate",
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"windwp/nvim-ts-autotag",
		-- "nvim-treesitter/nvim-treesitter-context",
		"nvim-treesitter/nvim-treesitter-textobjects",
		"HiPhish/rainbow-delimiters.nvim",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"cpp",
				-- "latex",
				"python",
				"bash",
				"typescript",
				"javascript",
				"html",
				"css",
				"scss",
				"markdown",
				"markdown_inline",
				"yaml",
				"json",
				"ruby",
				"tsx",
				"cmake",
				"awk",
				"gitignore",
				"dockerfile",
				"toml",
				"luadoc",
				"luap",
				"xml",
				"diff",
				"regex",
			},
			modules = {},
			sync_install = false,
			ignore_install = {},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
			fold = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					-- init_selection = "<C-space>",
					init_selection = "<leader>cs",
					-- node_incremental = "<C-space>",
					node_incremental = "<tab>",
					scope_incremental = "<S-tab>",
					node_decremental = "<bs>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = {
						["]f"] = "@function.outer",
						["]c"] = "@class.outer",
					},
					goto_previous_start = {
						["[f"] = "@function.outer",
						["[c"] = "@class.outer",
					},
				},
			},
		})

		vim.keymap.set("n", "<leader>ur", function()
			local rd = require("rainbow-delimiters")
			if rd.is_enabled(0) then
				rd.disable(0)
			else
				rd.enable(0)
			end
		end, { desc = "Toggle rainbow delimiters" })

		-- require("treesitter-context").setup({
		-- 	enable = true,
		-- 	max_lines = 3,
		-- })
	end,
}
