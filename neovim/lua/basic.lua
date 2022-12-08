-- 设置文件相关编码
vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8,cp936,chinese,latin-1"
-- jkhl 移动时光标周围保留 8 行
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
-- 行号相关设置
vim.o.number = true
vim.o.relativenumber = true
-- 高亮所在行
vim.o.cursorline = true
-- 显示左侧图标指示列
vim.o.signcolumn = "yes"
-- 右侧参考线，80 列
vim.o.colorcolumn = "100"
-- 缩进 4 个空格等于一个 tab
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftround = true
-- >> << 时移动长度
vim.o.shiftwidth = 4
-- 空格替代 tab
vim.o.expandtab = true
-- 新行对齐当前行
vim.o.autoindent = true
vim.o.smartindent = true
-- 搜索大小写不敏感，除非包含大写
vim.o.ignorecase = true
vim.o.smartcase = true
-- 边输入边搜索
vim.o.incsearch = true
-- 命令行高为 2
vim.o.cmdheight = 2
-- 当文件被外部程序修改时自动加载
vim.o.autoread = true
-- 禁止折行
vim.o.wrap = false
-- 允许隐藏被修改过的 buffer
vim.o.hidden = true
-- 不自动折叠
vim.o.foldlevel = 99

vim.o.updatetime = 300
-- 按键响应等待超时时间
vim.o.timeoutlen = 350

-- 样式
vim.o.background = "dark"
vim.o.termguicolors = true
-- 不可见字符的显示
vim.o.list = true
vim.o.listchars = "tab:» ,trail:·"
-- 补全增强
vim.o.wildmenu = true

vim.o.shortmess = vim.o.shortmess .. 'c'

-- 永远显示 tabline
vim.o.showtabline = 2
-- 使用相关状态栏插件后不需要 vim 模式提示
vim.o.showmode = false
