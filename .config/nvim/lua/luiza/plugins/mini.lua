return {
  -- ── Surround ────────────────────────────────────────────────────────────
  -- sa = add, sd = delete, sr = replace, sh = highlight, sf/sF = find
  -- Default operator prefix is 's', same feel as vim-surround / nvim-surround.
  -- NOTE: 's' normally means substitute (cl). Remap or set mappings below.
  {
    "nvim-mini/mini.surround",
    version = false,
    enabled = false,
    event = "VeryLazy",
    opts = {
      -- Remap to 'gz' prefix if you want to keep 's' for substitute:
      -- mappings = {
      --   add            = "gza",
      --   delete         = "gzd",
      --   replace        = "gzr",
      --   find           = "gzf",
      --   find_prev      = "gzF",
      --   highlight      = "gzh",
      --   update_n_lines = "gzn",
      -- },
      n_lines = 50, -- how many lines to search for surrounding
    },
  },

  -- ── Autopairs ───────────────────────────────────────────────────────────
  -- LazyVim's recommended options shown here — tweak to taste.
  {
    "nvim-mini/mini.pairs",
    version = false,
    event = "VeryLazy",
    opts = {
      modes = { insert = true, command = true, terminal = true },
      -- Don't pair when the next char is a word character, quote, bracket, etc.
      skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
      -- Don't pair inside these treesitter nodes (avoids double-quoting in strings)
      skip_ts = { "string" }, -- Q: keep?
      -- Don't pair when closing brackets already outnumber opening ones
      skip_unbalanced = true,
      -- Handle markdown code fences gracefully
      markdown = true,
      mappings = {
        [" "] = { action = "open", pair = "  ", neigh_pattern = "[%(%[{][%)%]}]" },
      },
    },
  },

  -- ── mini.ai (text objects) ───────────────────────────────────────────────
  -- Extends a/i text objects: af/if (function), ac/ic (class), at/it (tag),
  -- a"/i", a(/i(, etc. Works great alongside mini.surround.
  {
    "nvim-mini/mini.ai",
    version = false,
    event = "VeryLazy",
    opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
        custom_textobjects = {
          -- Function (treesitter)
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
          -- Class (treesitter)
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
          -- Block / conditional / loop under 'o'
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }),
          -- HTML/JSX tags
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
          -- Digits
          d = { "%f[%d]%d+" },
        },
      }
    end,
  },

  -- ── mini.map ────────────────────────────────────────────────────────────
  -- Minimap in the sign column. Toggle with <leader>mm or set up keys below.
  {
    "nvim-mini/mini.map",
    version = false,
    event = "VeryLazy",
    config = function()
      local map = require("mini.map")
      map.setup({
        integrations = {
          map.gen_integration.builtin_search(),
          map.gen_integration.diagnostic(),
          map.gen_integration.diff(),
        },
        symbols = {
          encode = map.gen_encode_symbols.dot("4x2"), -- or "3x2" -- NOTE: try shade instead of dot
          scroll_line = "▶",
          scroll_view = "┃", -- try ┋ or ┋ or ╎
        },
        window = {
          side = "right",
          width = 10,
          winblend = 15,
          show_integration_count = true,
        },
      })

      -- Toggle / refresh keymaps
      vim.keymap.set("n", "<leader>mm", map.toggle, { desc = "Toggle minimap" })
      vim.keymap.set("n", "<leader>mf", map.toggle_focus, { desc = "Focus minimap" })
      vim.keymap.set("n", "<leader>mr", map.refresh, { desc = "Refresh minimap" })
    end,
  },

  -- ── mini.files ──────────────────────────────────────────────────────────
  -- Column-style file explorer (edit the filesystem like a buffer).
  -- "=" to synchronize after edits
  {
    "nvim-mini/mini.files",
    version = false,
    lazy = false,
    keys = {
      {
        "<leader>e",
        function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0))
        end,
        desc = "Open mini.files (current file)",
      },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.uv.cwd())
        end,
        desc = "Open mini.files (cwd)",
      },
    },
    opts = {
      mappings = {
        close = "<esc>",
        go_in_plus = "<CR>",
        go_out = "H",
        go_out_plus = "h",
        reveal_cwd = ".",
      },
      windows = {
        preview = true, -- show file preview in rightmost column
        width_focus = 30,
        width_preview = 60,
      },
      options = {
        use_as_default_explorer = true, -- hijacks netrw
      },
    },
  },

  -- ── mini.sessions ───────────────────────────────────────────────────────
  -- IMPORTANT: mini.sessions does NOT auto-create sessions like persistence.nvim.
  -- Workflow:
  --   1. Open your project, arrange windows/buffers.
  --   2. Run :lua MiniSessions.write('project-name')  ← creates the session.
  --   3. From then on, autowrite = true saves on exit automatically.
  --   4. autoread = true restores it next time you open nvim with no args.
  --
  -- If persistence.nvim wasn't working, it was likely because sessions were
  -- never explicitly written first. Same caveat applies here.
  --
  -- For a fully automatic (persistence-style) experience, see the autocmd below.
  {
    "nvim-mini/mini.sessions",
    version = false,
    enabled = false, -- FIXME: doees not work
    lazy = false, -- must load early for autoread to work on startup
    opts = {
      autoread = true, -- restore last session when nvim opened with no args
      autowrite = true, -- save session on exit (only if one is active)
      directory = vim.fn.stdpath("data") .. "/sessions/",
      -- file = "Session.vim", -- local session file name (in cwd)
    },
    config = function(_, opts)
      require("mini.sessions").setup(opts)

      -- ── Keymaps ─────────────────────────────────────────────────────────
      vim.keymap.set("n", "<leader>qs", function()
        MiniSessions.write() -- write active session (or prompt for name)
      end, { desc = "Save session" })

      vim.keymap.set("n", "<leader>ql", function()
        MiniSessions.select() -- pick from detected sessions
      end, { desc = "Load session" })

      vim.keymap.set("n", "<leader>qd", function()
        MiniSessions.select("delete")
      end, { desc = "Delete session" })
    end,
  },
  {
    "nvim-mini/mini.clue",
    version = false,
    enabled = false,
    config = function()
      local miniclue = require("mini.clue")
      miniclue.setup({
        window = { delay = 500 }, -- TODO: add more width
        triggers = {
          -- Leader triggers
          { mode = { "n", "x" }, keys = "<Leader>" },

          -- `[` and `]` keys
          { mode = "n", keys = "[" },
          { mode = "n", keys = "]" },

          -- Built-in completion
          { mode = "i", keys = "<C-x>" },

          -- `g` key
          { mode = { "n", "x" }, keys = "g" },

          -- Marks
          { mode = { "n", "x" }, keys = "'" },
          { mode = { "n", "x" }, keys = "`" },

          -- Registers
          { mode = { "n", "x" }, keys = '"' },
          { mode = { "i", "c" }, keys = "<C-r>" },

          -- Window commands
          { mode = "n", keys = "<C-w>" },

          -- `z` key
          { mode = { "n", "x" }, keys = "z" },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.square_brackets(),
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
          { mode = "n", keys = "<leader>b", desc = "+Buffers" },
          -- TODO: add more
        },
      })
    end,
  },
  {
    "nvim-mini/mini.cursorword",
    version = false,
    enabled = false,
    config = function()
      _G.cursorword_blocklist = function()
        local curword = vim.fn.expand("<cword>")
        local filetype = vim.bo.filetype

        local blocklist = {}
        if filetype == "lua" then
          blocklist = { "local", "require", "--" }
        elseif filetype == "javascript" or filetype == "typescript" or filetype == "tsx" or filetype == "jsx" then
          blocklist = { "import", "$/$/", "const", "let" }
        elseif filetype == "cpp" or filetype == "c" then
          blocklist = { "$/$/", "const" }
        end

        vim.b.minicursorword_disable = vim.tbl_contains(blocklist, curword)
      end

      vim.api.nvim_create_autocmd("CursorMoved", {
        callback = _G.cursorword_blocklist,
      })
      -----
      vim.keymap.set("n", "<leader>uH", function()
        vim.g.minicursorword_disable = not vim.g.minicursorword_disable
        vim.notify("cursorword " .. (vim.g.minicursorword_disable and "disabled" or "enabled"))
      end, { desc = "Toggle mini.cursorword highlighting" })
      -----
      require("mini.cursorwor").setup({})
    end,
  },
}
