return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		local ufo = require("ufo")
		local map = vim.keymap.set

		map("n", "zR", ufo.openAllFolds, { desc = "Open all folds" })
		map("n", "zM", ufo.closeAllFolds, { desc = "Close all folds" })
		map("n", "zK", function()
			local winid = ufo.peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek fold" })

		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				-- Use treesitter for markdown so headings fold correctly;
				-- fall back to indent for everything else
				if filetype == "markdown" then
					return { "treesitter", "indent" }
				end
				return { "lsp", "indent" }
			end,
			-- Fold headings: collapse on load for markdown buffers
			open_fold_hl_timeout = 150,
		})
	end,
}
