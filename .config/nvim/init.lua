vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- TODO: reorganize plugins in folders, eg. UI, coding, workflow, etc
-- TODO: replace persistence
-- TODO: revisit ALT keymaps

-- TODO: borders: blink, which-key, telescope/picker, trouble, neo-tree/cokeline
-- TODO: blink: border color highlight?

-- ACTIVE THEME:
--vim.g.theme = "default"
-- vim.g.theme = "catppuccin"
-- vim.g.theme = "tokyonight"
-- vim.g.theme = "vague"
-- vim.g.theme = "blue-moon"
-- vim.g.theme = "gruvbox"
-- vim.g.theme = "palenight"
-- vim.g.theme = "nordic"
-- vim.g.theme = "kanagawa"
-- vim.g.theme = "nightfox"
-- vim.g.theme = "lovelace"
-- vim.g.theme = "sonokai"
-- vim.g.theme = "everforest"
-- vim.g.theme = "edge"
-- vim.g.theme = "poimandres"
vim.g.theme = "ethereal"
---

require("luiza.core.options")
require("luiza.core.keymaps")
require("luiza.core.autocmds")
require("luiza.lazy")

---
vim.cmd("colorscheme " .. vim.g.theme)
