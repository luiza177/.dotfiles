-------- Switch to abs when in insert mode
local numbertoggle = vim.api.nvim_create_augroup("NumberToggle", { clear = true })
vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  group = numbertoggle,
  callback = function()
    if vim.bo.buftype == "" then
      vim.opt.relativenumber = false
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
  group = numbertoggle,
  callback = function()
    if vim.bo.buftype == "" then
      vim.opt.relativenumber = true
    end
  end,
})

-------- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150 })
  end,
})

-------- No auto-comment
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    -- r = pressing enter; o = o or O; c = auto-wrapping long comments
    vim.opt.formatoptions:remove({ "c", "r", "o" })
  end,
})

--------- TeX files
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*.tex",
  callback = function()
    local file = vim.fn.expand("%:p") -- absolute path to current file
    local dir = vim.fn.expand("%:p:h") -- directory of current file

    vim.fn.jobstart({
      "latexmk",
      "-pdf",
      "-interaction=nonstopmode",
      "-output-directory=" .. dir,
      file,
    }, {
      stdout_buffered = true,
      stderr_buffered = true,
      on_exit = function(_, code)
        if code == 0 then
          vim.notify("LaTeX: build succeeded ✓", vim.log.levels.INFO)
        else
          vim.notify("LaTeX: build failed (exit " .. code .. ")", vim.log.levels.ERROR)
        end
      end,
      -- Optional: print pdflatex output to nvim's :messages
      on_stdout = function(_, data)
        if data then
          vim.notify(table.concat(data, "\n"), vim.log.levels.DEBUG)
        end
      end,
    })
  end,
})
