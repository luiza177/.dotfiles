return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  lazy = false,
  -- cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "windwp/nvim-ts-autotag",
    {
      "nvim-treesitter/nvim-treesitter-context",
      dependencies = { "folke/snacks.nvim" },
      init = function()
        local tsc = require("treesitter-context")
        Snacks.toggle({
          name = "Treesitter Context",
          get = tsc.enabled,
          set = function(state)
            if state then
              tsc.enable()
            else
              tsc.disable()
            end
          end,
        }):map("<leader>ut")
        return { mode = "cursor", max_lines = 3 }
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch = "main",
      opts = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["aa"] = "@parameter.outer",
            ["ia"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      },
    },
    {
      "HiPhish/rainbow-delimiters.nvim",
      dependencies = { "folke/snacks.nvim" },
      init = function()
        local rd = require("rainbow-delimiters")
        Snacks.toggle({
          name = "Rainbow delimiters",
          get = function()
            return rd.is_enabled(0)
          end,
          set = function(state)
            if state then
              rd.enable(0)
            else
              rd.disable(0)
            end
          end,
        }):map("<leader>ur")
      end,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        -- Enable treesitter highlighting and disable regex syntax
        pcall(vim.treesitter.start)
        -- Enable treesitter-based indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })

    ---
    local ensureInstalled = {
      "lua",
      "vim",
      "vimdoc",
      "cpp",
      "c",
      -- "latex",
      "python",
      "bash",
      "typescript",
      "javascript",
      "html",
      "css",
      "scss",
      "markdown",
      "markdown_inline",
      "yaml",
      "json",
      "ruby",
      "tsx",
      "cmake",
      "awk",
      "gitignore",
      "dockerfile",
      "toml",
      "luadoc",
      "luap",
      "xml",
      "diff",
      "regex",
    }
    local alreadyInstalled = require("nvim-treesitter.config").get_installed()
    local parsersToInstall = vim
      .iter(ensureInstalled)
      :filter(function(parser)
        return not vim.tbl_contains(alreadyInstalled, parser)
      end)
      :totable()
    require("nvim-treesitter").install(parsersToInstall)
  end,
  config = function()
    -- require("nvim-treesitter.configs").setup({
    --   ensure_installed = {
    --     "lua",
    --     "vim",
    --     "vimdoc",
    --     "cpp",
    --     "c",
    --     -- "latex",
    --     "python",
    --     "bash",
    --     "typescript",
    --     "javascript",
    --     "html",
    --     "css",
    --     "scss",
    --     "markdown",
    --     "markdown_inline",
    --     "yaml",
    --     "json",
    --     "ruby",
    --     "tsx",
    --     "cmake",
    --     "awk",
    --     "gitignore",
    --     "dockerfile",
    --     "toml",
    --     "luadoc",
    --     "luap",
    --     "xml",
    --     "diff",
    --     "regex",
    --   },
    --   modules = {},
    --   sync_install = false,
    --   ignore_install = {},
    --   auto_install = true,
    --   -- highlight = { enable = true },
    --   -- indent = { enable = true },
    --   autotag = { enable = true },
    --   fold = { enable = true },
    --   incremental_selection = {
    --     enable = true,
    --     keymaps = {
    --       -- init_selection = "<C-space>",
    --       init_selection = "<leader>cs",
    --       -- node_incremental = "<C-space>",
    --       node_incremental = "<tab>",
    --       scope_incremental = "<S-tab>",
    --       node_decremental = "<bs>",
    --     },
    --   },
    --   textobjects = {
    --     select = {
    --       enable = true,
    --       lookahead = true,
    --       keymaps = {
    --         ["af"] = "@function.outer",
    --         ["if"] = "@function.inner",
    --         ["ac"] = "@class.outer",
    --         ["ic"] = "@class.inner",
    --         ["aa"] = "@parameter.outer",
    --         ["ia"] = "@parameter.inner",
    --       },
    --     },
    --     move = {
    --       enable = true,
    --       set_jumps = true,
    --       goto_next_start = {
    --         ["]f"] = "@function.outer",
    --         ["]c"] = "@class.outer",
    --       },
    --       goto_previous_start = {
    --         ["[f"] = "@function.outer",
    --         ["[c"] = "@class.outer",
    --       },
    --     },
    --   },
    -- })
  end,
}
