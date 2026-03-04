return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- formatters:
				"stylua",
				"black",
				"isort",
				"rubocop",
				"clang-format",
				"shfmt",
				"prettier",
				"omnisharp",
				"latexindent",
				-- linters:
				"shellcheck",
				"cpplint",
				"pylint",
				"eslint_d",
			},
		})
	end,
}
