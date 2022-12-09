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

--- lsp 回调函数快捷键设置 {{
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
  -- go xx
  mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
  mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
  mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
  mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>")
  mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true }<CR>")
  -- 没用到
  -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
  -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
  -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end
--- }}

return pluginKeys
-- }
