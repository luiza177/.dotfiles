return {
  "mcauley-penney/visual-whitespace.nvim",
  event = "ModeChanged *:[vV\22]", -- optionally, lazy load on entering visual mode

  -- This can go in your color scheme or in your plugin config:
  -- vim.api.nvim_set_hl(0, "VisualNonText", { fg = "#5D5F71", bg = "#24282d"})

  -- opts = {
  --   enabled = true,
  --   highlight = { link = "Visual", default = true },
  --   match_types = {
  --     space = true,
  --     tab = true,
  --     nbsp = true,
  --     lead = false,
  --     trail = false,
  --   },
  --   list_chars = {
  --     space = "·",
  --     tab = "↦",
  --     nbsp = "␣",
  --     lead = "‹",
  --     trail = "›",
  --   },
  --   fileformat_chars = {
  --     unix = "↲",
  --     mac = "←",
  --     dos = "↙",
  --   },
  --   ignore = { filetypes = {}, buftypes = {} },
  -- }
  config = true,
}
