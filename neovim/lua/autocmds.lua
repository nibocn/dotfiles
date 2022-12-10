local autocmd = vim.api.nvim_create_autocmd

local foldFixGroup = vim.api.nvim_create_augroup('foldFixGroup', { clear = true, })
-- 解决 telescope 插件导致代码折叠不生效的问题
autocmd({'BufRead', 'BufWinEnter'}, {
  group = foldFixGroup,
  pattern = '*',
  command = 'normal! zx zR',
})

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
