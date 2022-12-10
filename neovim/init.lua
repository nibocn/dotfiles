-- 基础设置
require('basic')
-- Packer 插件管理
require('plugins')
-- 缓存lua模块
require('impatient')
-- 快捷键映射
require('keybindings')
-- 主题设置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.project')
require('plugin-config.dashboard')
require('plugin-config.nvim-treesitter')

-- lsp
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')


require('autocmds')
