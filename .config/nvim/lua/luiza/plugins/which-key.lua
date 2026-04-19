return {
  "folke/which-key.nvim",
  enabled = false,
  event = "VeryLazy",
  -- event = "VimEnter",
  config = function()
    local wk = require("which-key")

    wk.setup({
      delay = 500,
      preset = "helix",
      plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 10, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = false, -- adds help for operators like d, y, ...
          motions = false, -- adds help for motions
          text_objects = false, -- help for text objects triggered after entering an operator
          windows = false, -- default bindings on <c-w>
          nav = false, -- misc bindings to work with windows
          z = false, -- bindings for folds, spelling and others prefixed with z
          g = false, -- bindings for prefixed with g
        },
      },
    })

    wk.add({
      -- register key group names
      { "<leader>f", group = "find", icon = "󰈞" },
      { "<leader>s", group = "split", icon = "" },
      { "<leader>t", group = "tab", icon = "󰓩" },
      { "<leader>x", group = "trouble", icon = "" },
      { "<leader>u", group = "ui", icon = "󰍹" },
      { "<leader>b", group = "buffer", icon = "" },
      { "<leader>d", group = "diagnostics", icon = "" },
      { "<leader>l", group = "lsp", icon = "" },
      { "<leader>c", group = "code", icon = "󰘦" },
      { "<leader>r", group = "replace", icon = "" },
      { "<leader>g", group = "git", icon = "󰊢" },
      { "<leader>n", group = "notifications", icon = "" },
      { "<leader>q", group = "sessions", icon = "" },
      { "<leader>o", group = "Obsidian", icon = "" },
      { "<leader>m", group = "mini map", icon = "" },

      { "<leader>L", desc = "Open Lazy package manager", icon = "" },
      { "<leader>M", desc = "Open Mason", icon = "" },

      { "<leader>e", desc = "explorer", icon = "󰙅" },
      { "<leader>E", desc = "explorer (cwd)", icon = "󰙅" },

      -- markdown (markdown-plus.nvim)
      { "<localleader>m", group = "Markdown formatting...", icon = "󰽛" },
      { "<localleader>mQ", group = "Callouts...", icon = "" },
      { "<localleader>mf", group = "Footnotes...", icon = "󰽒" },
      { "<localleader>h", group = "Markdown headings...", icon = "" },
      { "<localleader>t", group = "Markdown tables...", icon = "" },
      { "<localleader>tm", group = "Move...", icon = "" },
      { "<localleader>ts", group = "Sort...", icon = "" },
      { "<localleader>tv", group = "CSV", icon = "" },
      { "<leader>um", group = "Live preview", icon = "" },

      --------------- NORMAL VIM KEYS

      -- z prefix
      { "z", group = "folds/view", icon = "" },
      { "za", desc = "Toggle fold", icon = "" },
      { "zo", desc = "Open fold", icon = "" },
      { "zc", desc = "Close fold", icon = "" },
      { "zR", desc = "Open all folds", icon = "" },
      { "zM", desc = "Close all folds", icon = "󰄾" },
      { "zz", desc = "Center cursor", icon = "󰘢" },
      { "zt", desc = "Cursor to top of screen", icon = "󰘣" },
      { "zb", desc = "Cursor to bottom of screen", icon = "" },
      { "z=", desc = "Spelling suggestions", icon = "" },

      -- [ and ] navigation
      { "[", group = "prev", icon = "󰒮" },
      { "]", group = "next", icon = "󰒭" },

      -- Ctrl prefixed
      { "<C-d>", desc = "Scroll down" },
      { "<C-u>", desc = "Scroll up" },
      { "<C-o>", desc = "Jump back" },
      { "<C-i>", desc = "Jump forward" },
      { "<C-^>", desc = "Alternate buffer" },

      -- misc
      { "%", desc = "Jump to matching pair" },
      { "@:", desc = "Repeat last command", icon = "" },
    })
  end,
}
