local function prevent_insert()
  vim.cmd.stopinsert()
end

local borders = require("luiza.core.borders")

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    bigfile = { enabled = true },
    ---------
    dashboard = {
      enabled = true,
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
    ---------
    dim = {
      enabled = true,
      animate = {
        duration = {
          total = 100,
        },
      },
    },
    ---------
    input = { enabled = true },
    ---------
    picker = {
      enabled = true,
      -- layout = {
      -- preset = "telescope",
      -- },
      layouts = {
        default = {
          layout = {
            box = "horizontal",
            width = 0.8,
            min_width = 120,
            height = 0.8,
            {
              box = "vertical",
              border = borders.border_chars_square,
              title = "{title} {live} {flags}",
              {
                win = "input",
                height = 1,
                border = borders.border_chars_square,
              },
              { win = "list", border = "none" },
            },
            {
              win = "preview",
              title = "{preview}",
              border = borders.border_chars_square,
              width = 0.5,
            },
          },
        },
        select = {
          layout = {
            border = borders.border_chars_square,
          },
        },
        dropdown = {
          layout = {
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.8,
            border = "none",
            box = "vertical",
            {
              win = "preview",
              title = "{preview}",
              height = 0.4,
              border = borders.border_chars_square,
            },
            {
              box = "vertical",
              border = borders.border_chars_square,
              title = "{title} {live} {flags}",
              title_pos = "center",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
          },
        },
        vertical = {
          layout = {
            backdrop = false,
            width = 0.5,
            min_width = 80,
            height = 0.8,
            min_height = 30,
            box = "vertical",
            border = borders.border_chars_square,
            title = "{title} {live} {flags}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            {
              win = "preview",
              title = "{preview}",
              height = 0.4,
              border = "top",
            },
          },
        },
        vscode = {
          layout = {
            -- border = "none",
            border = borders.border_chars_square,
            backdrop = false,
            row = 1,
            width = 0.4,
            min_width = 80,
            height = 0.4,
            box = "vertical",
            title = "{title}",
            title_pos = "center",
            {
              win = "input",
              height = 1,
              -- border = borders.border_chars_square,
              border = "bottom",
              -- title = "{title} {live} {flags}",
              -- title_pos = "center",
            },
            { win = "list", border = "hpad" }, -- Q: or "none"
            { win = "preview", title = "{preview}", border = "top" },
          },
        },
        telescope = {
          reverse = true,
          layout = {
            box = "horizontal",
            backdrop = false,
            width = 0.8,
            height = 0.9,
            border = "none",
            {
              box = "vertical",
              {
                win = "list",
                title = " Results ",
                title_pos = "center",
                border = borders.border_chars_square,
              },
              {
                win = "input",
                height = 1,
                border = borders.border_chars_square,
                title = "{title} {live} {flags}",
                title_pos = "center",
              },
            },
            {
              win = "preview",
              title = "{preview:Preview}",
              width = 0.45,
              border = borders.border_chars_square,
              title_pos = "center",
            },
          },
        },
      },
    },
    ---------
    quickfile = { enabled = true },
    ---------
    rename = { enabled = true },
    ---------
    lazygit = {
      theme = {
        inactiveBorderColor = { fg = "LazyGitInactiveBorder" },
      },
    },
    ---------
    toggle = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    -- Top Pickers & Explorer
    -- { "<leader>fl", function() Snacks.picker.grep({ dirs = { vim.uv.cwd() } }) end, desc = "Grep" },
    { "<leader>fl", function() Snacks.picker.grep({ hidden = true }) end, desc = "Grep" }, -- HACK: in dotfiles repo, grep doesn't see config folder
    { "<leader>nh", function() Snacks.picker.notifications({ on_show = prevent_insert }) end, desc = "Notification History" },
    -- { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>nn", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      -- { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },


      -- find
      { "<leader>fF", function() Snacks.picker.smart() end, desc = "Smart Find Files" }, -- HINT: buffers, recent, files, cwd/frecency bonus
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fb", function() Snacks.picker.buffers({ sort_lastused = true, layout = "vscode", current = false, on_show = prevent_insert }) end, desc = "Buffers" },
      { "<leader>fC", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" }, -- HINT: good for neo vim plugin files
      -- { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      -- { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" }, -- WARN: looks funny
      { "<leader>fr", function() Snacks.picker.recent({ matcher = { frecency = false, history_bonus = true}}) end, desc = "Recent" },

      -- search
      { "<leader>fR", function() Snacks.picker.registers({ on_show = prevent_insert }) end, desc = "Registers" },
      { '<leader>f/', function() Snacks.picker.search_history({ on_show = prevent_insert }) end, desc = "Search History" },
      { "<leader>fc", function() Snacks.picker.command_history({ on_show = prevent_insert }) end, desc = "Command History" },
      -- { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>di", function() Snacks.picker.diagnostics({ on_show = prevent_insert }) end, desc = "Diagnostics" }, -- QUESTION: keep?
      { "<leader>db", function() Snacks.picker.diagnostics_buffer({ on_show = prevent_insert }) end, desc = "Buffer Diagnostics" }, -- QUESTION: keep?
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      { "<leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
      { "<leader>fj", function() Snacks.picker.jumps({ on_show = prevent_insert }) end, desc = "Jumps" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fL", function() Snacks.picker.loclist({ on_show = prevent_insert }) end, desc = "Location List" },
      { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" }, -- QUESTION:  keep or trouble?
      { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
      -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },


      -- git
      { "<leader>gG", function() Snacks.lazygit() end, desc = "Lazygit" },
      { "<leader>gb", function() Snacks.picker.git_branches({ on_show = prevent_insert}) end, desc = "Git Branches" },

      { "<leader>gL", function() Snacks.picker.git_log({ on_show = prevent_insert}) end, desc = "Git Log" },
      { "<leader>gl", function() Snacks.picker.git_log_line({ on_show = prevent_insert}) end, desc = "Git Log Line" },
      { "<leader>gf", function() Snacks.picker.git_log_file({ on_show = prevent_insert}) end, desc = "Git Log File" },

      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash({ on_show = prevent_insert}) end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff({ on_show = prevent_insert}) end, desc = "Git Diff (Hunks)" },

      -- [g]it[h]ub
      -- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
      -- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
      { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
      { "<leader>gpp", function() Snacks.picker.gh_pr({ on_show = prevent_insert}) end, desc = "GitHub Pull Requests (open)" },
      { "<leader>gpP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },


      -- grep
      { "<leader>bl", function() Snacks.picker.lines() end, desc = "Buffer Lines" }, -- NOTE: not sure what this is for
      -- { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },


      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "<leader>cd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "<leader>cD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "gR", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "<leader>cr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "<leader>ci", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "gt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ct", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
      { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
      { "<leader>ls", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },


      -- Other
      -- { "<leader>z", function() Snacks.zen() end, desc = "Toggle Zen Mode" },
      -- { "<leader>Z", function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
      { "<leader>.", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
      { "<leader>S", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },
      { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
      { "<leader>rR", function() Snacks.rename.rename_file() end, desc = "Rename File" },

      -- { "<c-/>", function() Snacks.terminal() end, desc = "Toggle Terminal" },
      -- { "<c-_>", function() Snacks.terminal() end, desc = "which_key_ignore" },
      { "]]", function() Snacks.words.jump(vim.v.count1) end, desc = "Next Reference", mode = { "n" } },
      { "[[", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference", mode = { "n" } },
      { "<leader>N", function()
          Snacks.win({
              file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
              width = 0.6, height = 0.6,
              wo = { spell = false, wrap = false, signcolumn = "yes", statuscolumn = " ", conceallevel = 3 },
          })
      end, desc = "Neovim News" },
    -- stylua: ignore end
  },
  init = function()
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local snacks_wins = {}
        local floating_wins = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local ft = vim.api.nvim_get_option_value("filetype", { buf = vim.api.nvim_win_get_buf(w) })
          if ft:match("snacks_") ~= nil then
            table.insert(snacks_wins, w)
          elseif vim.api.nvim_win_get_config(w).relative ~= "" then
            table.insert(floating_wins, w)
          end
        end
        if #wins - #floating_wins - #snacks_wins == 1 then
          for _, w in ipairs(snacks_wins) do
            vim.api.nvim_win_close(w, true)
          end
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end

        -- Override print to use snacks for `:=` command
        if vim.fn.has("nvim-0.11") == 1 then
          vim._print = function(_, ...)
            dd(...)
          end
        else
          vim.print = _G.dd
        end

        -- create some toggle mappings
        Snacks.toggle.option("spell", { name = "spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "relative number" }):map("<leader>ul")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uo") -- hides characters like in markdown **bold**
        Snacks.toggle.treesitter():map("<leader>ut")
        -- snacks.toggle.option("background", { off = "light", on = "dark", name = "dark background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        -- snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>ud")

        -- custom toggles:

        -- virtual text

        -- git signs

        -- format on save

        -- true/false, yes/no, active/inactive, enable(d)/disable(d), on/off
        local toggles = {
          ["true"] = "false",
          ["always"] = "never",
          ["yes"] = "no",
          ["on"] = "off",
          ["enable"] = "disable",
          ["enabled"] = "disabled",
          ["active"] = "inactive",
        }

        Snacks.toggle
          .new({
            id = "switch",
            name = "Switch",
            get = function()
              local cword = vim.fn.expand("<cword>")
              for word, opposite in pairs(toggles) do
                if cword == word then
                  return true
                end
                if cword == opposite then
                  return false
                end
              end
              return nil
            end,
            set = function(state)
              local cword = vim.fn.expand("<cword>")
              local newWord
              for word, opposite in pairs(toggles) do
                if cword == word then
                  newWord = state and word or opposite
                end
                if cword == opposite then
                  newWord = state and word or opposite
                end
              end

              if newWord then
                local prevCursor = vim.api.nvim_win_get_cursor(0)
                vim.cmd.normal({ '"_ciw' .. newWord, bang = true })
                vim.api.nvim_win_set_cursor(0, prevCursor)
              end
            end,
          })
          :map("<leader>cc")

        -- virt column
      end,
    })
  end,
}
