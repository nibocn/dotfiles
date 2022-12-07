local status, nvim_tree = pcall(require, 'nvim-tree')
if not status then
  vim.notify('没有找到 nvim-tree 插件')
  return
end

-- 列表操作快捷键
local keys_list = require('keybindings').nvimTreeKeyList
nvim_tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏 . 文件和自定义隐藏文件
  filters = {
    dotfiles = true,
    custom = { 'node_modules' },
  },
  view = {
    mappings = {
      custom_only = false,
      list = keys_list,
    },
    -- 显示行号
    number = true,
    -- 显示相对行号
    relativenumber = true,
  },
  system_open = {
    cmd = 'open', -- mac 使用 open 命令打开
  },
})

-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
