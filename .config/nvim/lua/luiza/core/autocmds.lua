-------- Switch to abs when in insert mode
local numbertoggle = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
	group = numbertoggle,
	callback = function()
		if vim.bo.buftype == "" then
			vim.opt.relativenumber = false
		end
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
	group = numbertoggle,
	callback = function()
		if vim.bo.buftype == "" then
			vim.opt.relativenumber = true
		end
	end,
})

-------- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
	end,
})

-------- No auto-comment
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- r = pressing enter; o = o or O; c = auto-wrapping long comments
		vim.opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
