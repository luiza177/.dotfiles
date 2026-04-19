return {
  "miikanissi/modus-themes.nvim",
  enabled = vim.g.theme == "modus_vivendi",
  priority = 1000,
  opts = { style = "modus_vivendi", variants = { modus_vivendi = "tinted" } },
  -- TODO: override comments color, override mini.files bg/border
}
