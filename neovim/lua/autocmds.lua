local autocmd = vim.api.nvim_create_autocmd

local oNewlineGroup = vim.api.nvim_create_augroup('oNewlineGroup', { clear = true, })
-- 用 o 换行不要延续注释
autocmd("BufEnter", {
  group = oNewlineGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

local imSwitchGroup = vim.api.nvim_create_augroup('imSwitchGroup', { clear = true, })
-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select
autocmd("InsertLeave", {
  group = imSwitchGroup,
  callback = require("utils.im-select").insertLeave,
})
autocmd("InsertEnter", {
  group = imSwitchGroup,
  callback = require("utils.im-select").insertEnter,
})

