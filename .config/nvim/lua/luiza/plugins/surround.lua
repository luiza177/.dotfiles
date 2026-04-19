return {
  "kylechui/nvim-surround",
  event = "VeryLazy",
  config = function()
    vim.g.nvim_surround_no_mappings = true -- disable all defaults at once
    require("nvim-surround").setup()

    -- Normal mode
    vim.keymap.set("n", "sa", "<Plug>(nvim-surround-normal)", { desc = "Surround add" })
    vim.keymap.set("n", "sass", "<Plug>(nvim-surround-normal-cur)", { desc = "Surround add (current line)" })
    vim.keymap.set("n", "sA", "<Plug>(nvim-surround-normal-line)", { desc = "Surround add (new lines)" })
    vim.keymap.set(
      "n",
      "sAss",
      "<Plug>(nvim-surround-normal-cur-line)",
      { desc = "Surround add (current line, new lines)" }
    )
    vim.keymap.set("n", "sd", "<Plug>(nvim-surround-delete)", { desc = "Surround delete" })
    vim.keymap.set("n", "sr", "<Plug>(nvim-surround-change)", { desc = "Surround replace" })
    vim.keymap.set("n", "sR", "<Plug>(nvim-surround-change-line)", { desc = "Surround replace (new lines)" })

    -- Visual mode
    vim.keymap.set("x", "sa", "<Plug>(nvim-surround-visual)", { desc = "Surround add" })
    vim.keymap.set("x", "sA", "<Plug>(nvim-surround-visual-line)", { desc = "Surround add (new lines)" })

    -- Insert mode (keeping defaults, just re-binding)
    vim.keymap.set("i", "<C-g>s", "<Plug>(nvim-surround-insert)", { desc = "Surround insert" })
    vim.keymap.set("i", "<C-g>S", "<Plug>(nvim-surround-insert-line)", { desc = "Surround insert (new lines)" })
  end,
}
