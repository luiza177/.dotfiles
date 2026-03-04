return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "pylint" },
			ruby = { "rubocop" },
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
			cpp = { "cpplint" },
			c = { "cpplint" },
			-- cs = { "csharpier" },
			cs = { "dotnet-csharp" },
		}
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- trigger linting
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				-- lint.try_lint()
				lint.try_lint(nil, { ignore_errors = true })
			end,
		})

		-- manual trigger
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Lint current file" })
	end,
}
