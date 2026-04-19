return {
  "uga-rosa/ccc.nvim",
  config = function()
    local ccc = require("ccc")

    local map = vim.keymap.set

    map("n", "<leader>uC", "<cmd>CccPick<cr>", { desc = "Color picker" })
    map("n", "<leader>uCo", "<cmd>CccConvert<cr>", { desc = "Convert color format" })

    ccc.setup({
      highlighter = {
        auto_enable = true,
        lsp = true,
      },
      outputs = {
        ccc.output.hex,
        ccc.output.hex_short,
        ccc.output.css_rgb,
        ccc.output.css_hsl,
      },
      pickers = {
        ccc.picker.hex,
        ccc.picker.css_rgb,
        ccc.picker.css_hsl,
        ccc.picker.css_name,
      },
    })
  end,
}
