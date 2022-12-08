local status, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status then
  vim.notify('没有找到 nvim-treesitter')
  return
end

treesitter.setup({
  -- 安装 language parser
  -- :TSInstallInfo 命令查看支持的语言
  ensure_installed = { 'java', 'go', 'rust', 'c', 'python', 'json', 'sql', 'bash', 'html', 'css', 'vim', 'lua', 'javascript', 'typescript', 'tsx' },
  -- 缺少解析器的时候自动安装
  -- auto_install = true,
  -- 启用代码高亮模块
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  }
})

-- 开启 Folding 模块
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
