vim.cmd("let g:netrw_liststyle = 1")

local opt = vim.opt

-------- Line numbers: hybrid in normal mode (rel + abs)
opt.number = true
opt.relativenumber = true
-- opt.numberwidth = 6 -- default is 4
-- opt.statuscolumn = "%s %l %r "

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

-------- Indentation
opt.tabstop = 2 -- width of tab char
opt.shiftwidth = 2 -- spaces for indent
opt.expandtab = true -- use spaces instead of tab

-------- Search
opt.ignorecase = true
opt.smartcase = true -- if different cases are used, become case sensitive
opt.hlsearch = true -- highlight all matches
opt.incsearch = true -- show matches as you type

-- Appearance
opt.showmode = false -- hide built-in status
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes" -- column to the left of numbers for LSP diagnostics, always show
opt.cursorline = true
opt.scrolloff = 10 -- always keep 8 lines above/below cursor
opt.sidescrolloff = 10 -- same as above, but for horizontal, useful for wrap = true
opt.wrap = false

-------- Behavior
opt.clipboard = "unnamedplus" -- merge system and vim clipboard. Or use `"+y`
--opt.mouse = "a"               -- enable mouse on all modes
--opt.undofile = true           -- persistent undo history across sessions
--opt.backup = false            -- no backup files
--opt.updatetime = 250          -- faster CursorHold events (used by LSP, gitsigns) ???
opt.splitright = true -- vertical splits to the right
opt.splitbelow = true -- horizontal splits below
opt.iskeyword:append("-") -- treat hyphenated-words as one word for w/b/e motions

-------- Folds
-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"
-- opt.foldcolumn = "auto:5"
local borders = require("luiza.core.borders")

opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.fillchars = {
	foldopen = "",
	foldclose = "",
	foldsep = "│",
	fold = " ",
   horiz = borders.bottom_thin,
    horizup = borders.bottom_thin,
    horizdown = borders.right_thick,
    vert = borders.right_thick,
    vertleft = borders.right_thick,
    vertright = borders.right_thick,
    verthoriz = borders.right_thick,
    -- eob = " ",
    diff = "╱",
}

-------- No auto-comment
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- r = pressing enter; o = o or O; c = auto-wrapping long comments
		opt.formatoptions:remove({ "c", "r", "o" })
	end,
})
