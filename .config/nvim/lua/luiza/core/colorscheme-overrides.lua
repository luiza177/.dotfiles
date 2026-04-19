vim.api.nvim_set_hl(0, "LazyGitInactiveBorder", { link = "FloatBorder" })

local function colorscheme_overrides()
  ---- GETS
  local linenr_hl = vim.api.nvim_get_hl(0, { name = "LineNr" })
  -- local normal = vim.api.nvim_get_hl(0, { name = "Normal" })
  -- local comment_hl = vim.api.nvim_get_hl(0, { name = "Comment" })
  local cursorline_hl = vim.api.nvim_get_hl(0, { name = "CursorLine", link = false })

  -- diagnostics
  -- TODO: invert virtual text bg/fg
  -- vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = comment_hl.fg })
  -- vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = comment_hl.fg })

  ---- SETS
  vim.api.nvim_set_hl(0, "FoldColumn", { fg = linenr_hl.fg, bg = linenr_hl.bg })
  vim.api.nvim_set_hl(0, "DiagnosticUnnecessary", {
    italic = true,
    strikethrough = false,
    underdotted = true,
    underdashed = false,
    undercurl = false,
    sp = linenr_hl.fg,
    -- blend = 50,
  })
  vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", { bg = cursorline_hl.bg })
end

vim.api.nvim_create_autocmd("ColorScheme", { callback = colorscheme_overrides })
