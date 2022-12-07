local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- 文件保存
map('n', '<leader>fs', ':update<CR>', opt)
map('n', '<leader>fS', ':wall<CR>', opt)
-- 退出
map('n', '<leader>q', ':q<CR>', opt)
map('n', '<leader>Q', ':qa!<CR>', opt)
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

--- bufferline {{
-- buffer 切换
map("n", "]b", ":BufferLineCycleNext<CR>", opt)
map("n", "[b", ":BufferLineCyclePrev<CR>", opt)
-- buffer 关闭
map('n', '<leader>bd', ':Bdelete!<CR>', opt)
map('n', '<leader>bl', ':BufferLineCloseRight<CR>', opt)
map('n', '<leader>bh', ':BufferLineCloseLeft<CR>', opt)
map('n', '<leader>bc', ':BufferLinePickClose<CR>', opt)
--- }}

--- Telescope {{
-- 全局查找文件
map('n', '<leader>fp', ':Telescope find_files<CR>', opt)
-- 全局查找内容
map('n', '<leader>sa', '::Telescope live_grep<CR>', opt)
-- 查找 buffer
map('n', '<leader>bb', '::Telescope buffers<CR>', opt)
-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeKeyList = {
  i = {
    -- 上下移动
    ["<C-j>"] = "move_selection_next",
    ["<C-k>"] = "move_selection_previous",
    ["<Down>"] = "move_selection_next",
    ["<Up>"] = "move_selection_previous",
    -- 历史记录
    ["<C-n>"] = "cycle_history_next",
    ["<C-p>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}
--- }}

return pluginKeys
-- }
