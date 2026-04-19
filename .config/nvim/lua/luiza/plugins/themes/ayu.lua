return {
  "Shatur/neovim-ayu",
  enabled = vim.g.theme == "ayu",
  lazy = false,
  priority = 1000,
  config = function()
    require("ayu").setup({
      mirage = false, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
      overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
    })
  end,
}
