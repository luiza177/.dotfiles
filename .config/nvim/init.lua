vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ACTIVE THEME:
--vim.g.theme = "default"
-- vim.g.theme = "catppuccin"
-- vim.g.theme = "tokyonight"
-- vim.g.theme = "vague"
-- vim.g.theme = "blue-moon"
-- vim.g.theme = "gruvbox"
-- vim.g.theme = "palenight"
-- vim.g.theme = "nordic"
vim.g.theme = "kanagawa"
-- vim.g.theme = "nightfox"
-- vim.g.theme = "lovelace"
-- vim.g.theme = "sonokai"
-- vim.g.theme = "everforest"
---

require("luiza.core.options")
require("luiza.core.keymaps")
require("luiza.lazy")

---
vim.cmd("colorscheme " .. vim.g.theme)
