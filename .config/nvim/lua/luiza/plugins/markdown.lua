return {
  {
    "yousefhadder/markdown-plus.nvim",
    enabled = true,
    ft = "markdown",
    config = function()
      require("markdown-plus").setup({
        features = {
          -- text_formatting = false,
        },
        code_block = {
          languages = {
            "lua",
            "python",
            "javascript",
            "typescript",
            "bash",
            "json",
            "yaml",
            "markdown",
            "c",
            "cpp",
            "ruby",
          },
        },
      })
    end,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = true,
    ft = "markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      {
        "<leader>uR",
        ft = "markdown",
        desc = "Toggle render-markdown",
        callback = function()
          Snacks.toggle({
            name = "Render Markdown",
            get = function()
              return require("render-markdown.state").enabled
            end,
            set = function()
              require("render-markdown").toggle()
            end,
          }):toggle()
        end,
      },
    },
    opts = {
      completions = { lsp = { enabled = true } },
      render_modes = true,
      checkbox = {
        left_pad = 3,
      },
    },
  },
  {
    "brianhuster/live-preview.nvim",
    -- FIXME: not working in obsidian note
    enabled = true,
    dependencies = {
      "folke/snacks.nvim",
    },
    keys = {
      { "<leader>ump", "<cmd>LivePreview start<cr>", ft = "markdown", desc = "Live preview start" },
      { "<leader>umP", "<cmd>LivePreview stop<cr>", ft = "markdown", desc = "Live preview stop" },
    },
  },
  {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    enabled = true,
    ft = "markdown",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>oo", "<cmd>Obsidian<cr>", desc = "Obsidian commmands..." },
    },
    opts = {
      legacy_commands = false,
      ui = { enable = false }, -- NOTE: render-markdown does all rendering
      workspaces = {
        {
          name = "NOTES",
          path = "~/Dropbox/NOTES/",
        },
      },
    },
  },
}
