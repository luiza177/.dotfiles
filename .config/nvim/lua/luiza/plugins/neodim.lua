return {
  "zbirenbaum/neodim",
  event = "LspAttach",
  config = function()
    require("neodim").setup({
      alpha = 0.7,
      hide = {
        virtual_text = false,
        signs = false,
      },
    })
  end,
}
