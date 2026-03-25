-- TODO: refactor like LazyVim
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"mason-org/mason.nvim",
		"mason-org/mason-lspconfig.nvim",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", enabled = false, opts = {} },
	},
	config = function()
		local mason_lspconfig = require("mason-lspconfig")
		-- local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local map = vim.keymap.set

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybinds
				opts.desc = "Show LSP references"
				-- map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				-- map("n", "<leader>cr", "<cmd>Telescope lsp_references<CR>", opts)

				opts.desc = "Go to declaration"
				-- map("n", "gD", vim.lsp.buf.declaration, opts)
				map("n", "<leader>cD", vim.lsp.buf.declaration, opts)

				opts.desc = "Show LSP definitions"
				-- map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
				-- map("n", "<leader>cd", "<cmd>Telescope lsp_definitions<CR>", opts)

				opts.desc = "Show LSP implementations"
				-- map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
				-- map("n", "<leader>ci", "<cmd>Telescope lsp_implementations<CR>", opts)

				opts.desc = "Show LSP type definitions"
				-- map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)
				-- map("n", "<leader>ct", "<cmd>Telescope lsp_type_definitions<CR>", opts)

				opts.desc = "See available code actions"
				map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- INFO: in visual mode will apply to selection

				opts.desc = "Smart rename"
				map("n", "<leader>rn", vim.lsp.buf.rename, opts)

				opts.desc = "Show diagnostics for buffer"
				-- map("n", "<leader>db", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- originally: leader + D

				opts.desc = "Show diagnostics for current line"
				map("n", "<leader>dd", vim.diagnostic.open_float, opts) -- originally: leader + d

				opts.desc = "Go to previous diagnostic"
				map("n", "[d", vim.diagnostic.goto_prev, opts)
				map("n", "<leader>dp", vim.diagnostic.goto_prev, opts)

				opts.desc = "Go to next diagnostic"
				map("n", "]d", vim.diagnostic.goto_next, opts)
				map("n", "<leader>dn", vim.diagnostic.goto_next, opts)

				opts.desc = "Show documentation for what is under cursor"
				map("n", "K", function() -- QUESTION: do I still need this?
					vim.lsp.buf.hover()
				end, opts)
				map("n", "<M-space>", function()
					vim.lsp.buf.hover()
				end, opts)

				opts.desc = "Restart LSP"
				map("n", "<leader>lr", ":LspRestart<CR>", opts) -- originally: leader + rs

				-- opts.desc = "Toggle inlay hints"
				-- map("n", "<leader>lh", function()
				-- 	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
				-- end, opts)

				-- enable inlay hints
				-- local client = vim.lsp.get_client_by_id(ev.data.client_id)
				-- if client and client.supports_method("textDocument/inlayHint") then
				-- 	vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
				-- end
			end,
		})

		local capabilities = require("blink.cmp").get_lsp_capabilities()

		local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
		vim.diagnostic.config({
			-- virtual_lines = true, -- INFO: for underline diagnostics
			virtual_text = { -- INFO: for inline diagnostics (virtual_text)
				spacing = 4,
				source = "if_many",
				prefix = "●",
				-- this will set set the prefix to a function that returns the diagnostics icon based on the severity
				-- prefix = "icons",
			},
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.INFO] = signs["Info"],
					[vim.diagnostic.severity.HINT] = signs["Hint"],
					[vim.diagnostic.severity.WARN] = signs["Warn"],
					[vim.diagnostic.severity.ERROR] = signs["Error"],
				},
				linehl = {
					[vim.diagnostic.severity.ERROR] = "ErrorMsg",
				},
				numhl = {
					[vim.diagnostic.severity.WARN] = "WarningMsg",
				},
			},
			float = {
				-- border = "single",
				border = require("luiza.core.borders").border_chars_outer_thin,
				-- padding = 1,
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"html",
				"cssls",
				"svelte",
				"lua_ls",
				"emmet_ls",
				"pyright",
				"ruby_lsp", -- or solargraph
				"jsonls",
				"bashls",
				"marksman",
				"texlab",
				"taplo",
				"yamlls",
				"ts_ls",
				"clangd",
				"omnisharp",
			},
			automatic_installation = true,
		})

		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = { globals = { "vim", "require" } },
					completion = { callSnippet = "Replace" },
					workspace = { checkThirdParty = false },
					codeLens = { enable = true },
					doc = { privateName = "^_" },
					hint = {
						enable = true, -- enables inlay hints globally
						setType = true, -- show type hints on variable assignments
						paramType = true, -- show parameter types in function calls
						paramName = "Disable", -- don't show parameter *names* (would be redundant with paramType)
						semicolon = "Disable", -- don't hint missing semicolons (irrelevant in Lua)
						arrayIndex = "Disable", -- don't show numeric index hints in array tables
					},
				},
			},
		})

		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
		})

		vim.lsp.config("pyright", {
			capabilities = capabilities,
			settings = {
				python = { analysis = { typeCheckingMode = "basic" } },
			},
		})

		vim.lsp.config("cssls", {
			capabilities = capabilities,
			filetypes = { "css", "scss", "less" },
		})

		-- enable all installed servers
		vim.lsp.enable(mason_lspconfig.get_installed_servers())
	end,
}
