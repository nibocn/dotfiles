local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 文件保存
map('n', '<leader>fs', ':update<CR>', opt)
map('n', '<leader>fS', ':wall<CR>', opt)
-- 消除高亮显示匹配结果
map("n", "<C-n>", ":nohl<CR>", opt)
-- 窗口切换
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- 窗口比例大小调整
map("n", "<up>", ":resize +5<CR>", opt)
map("n", "<down>", ":resize -5<CR>", opt)
map("n", "<left>", ":vertical resize-5<CR>", opt)
map("n", "<right>", ":vertical resize+5<CR>", opt)
-- 移动到文件最后一次编辑的位置
-- 类似命令 gi 移动到文件最后一次编辑位置并进入 insert 模式
map("n", "gn", "`^", opt)
-- Buffer 切换
map("n", "]b", ":bp<CR>", opt)
map("n", "[b", ":bp<CR>", opt)
-- 复制当前行不带回车换行
map("n", "Y", "y$", opt)
-- 合并下一行并将光标保持不动
map("n", "J", "mzJ`z", opt)
-- 移动多行文本
map("v", "<leader>k", ":m '<-2<CR>gv=gv", opt)
map("v", "<leader>j", ":m '>+1<CR>gv=gv", opt)
map("n", "<leader>k", ":m .-2<CR>==", opt)
map("n", "<leader>j", ":m .+1<CR>==", opt)

-- 插件快捷键 {
local pluginKeys = {}

--- nvim-tree {{
map('n', '<leader>fe', ':NvimTreeToggle<CR>', opt)
pluginKeys.nvimTreeKeyList = {
  -- 显示隐藏文件
  -- 对应 filters 中的 custom
  { key = 'i', action = 'toggle_custom' },
  -- 对应 filters 中的 dotfiles 属性
  { key = '.', action = 'toggle_dotfiles' },
}
--- }}

return pluginKeys
-- }
