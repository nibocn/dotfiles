local status, bufferline = pcall(require, 'bufferline')
if not status then
  vim.notify('没有找到 bufferline')
  return
end

bufferline.setup({
  options = {
    -- 不显示关闭图标
    buffer_close_icon = '',
    -- 关闭 buffer 命令，使用 moll/vim-bbye 的 :Bdelete 命令
    close_command = 'Bdelete! %d',
    -- 侧边栏配置
    -- 左侧让出 nvim-tree 的位置，显示文字 File Explorer
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'File Explorer',
        highlight = 'Directory',
        text_align = 'left',
      },
    },
    -- 使用 nvim 内置 LSP
    diagnostics = 'nvim_lsp',
    -- 显示 LSP 报错图标
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
  },
  highlights = {
    -- 当前 buffer 不使用斜体，避免中文展示错乱
    buffer_selected = {
      italic = false,
    },
  },
})
