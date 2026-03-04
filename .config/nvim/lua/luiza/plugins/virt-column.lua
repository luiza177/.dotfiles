return {
  "lukas-reineke/virt-column.nvim",
  event = "BufEnter",
  opts = {
    char = "│", -- the line characte, not | pipe
    highlight = "VirtColumn",
    virtcolumn = "100",
  },
}
