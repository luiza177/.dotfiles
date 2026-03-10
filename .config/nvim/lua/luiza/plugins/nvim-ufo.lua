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
				return { "lsp", "indent" }
			end,
		})
	end,
}
