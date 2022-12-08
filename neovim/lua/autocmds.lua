-- 解决 telescope 插件导致代码折叠不生效的问题
pcall(
  vim.cmd,
  [[
    augroup fold_fix
    autocmd!
    autocmd BufRead * autocmd BufWinEnter * ++once normal! zx zR
    augroup end
  ]]
)
