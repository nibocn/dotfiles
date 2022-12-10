local status, telescope = pcall(require, 'telescope')
if not status then
  vim.notify('没有找到 telescope')
  return
end

local action_set = require("telescope.actions.set")

telescope.setup({
  defaults = {
    -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
    initial_mode = "insert",
    -- 窗口内快捷键
    mappings = require("keybindings").telescopeKeyList,
  },
  pickers = {
    -- 内置 pickers 配置
    find_files = {
      -- 查找文件换皮肤，支持的参数有： dropdown, cursor, ivy
      -- theme = "dropdown", 
      -- 解决 telescope 引起的代码折叠失败的问题
      attach_mappings = function(prompt_bufnr)
        action_set.select:enhance({
          post = function()
            vim.cmd(":normal! zx")
          end
        })
        return true
      end,
    }
  },
  extensions = {
     -- 扩展插件配置
  },
})
