local M = {}

M.keyAttach = function(bufnr)
  local function buf_set_keymap(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
  end
  -- 绑定快捷键
  require('keybindings').mapLSP(buf_set_keymap)
end

-- 禁用格式化功能，交给专门插件插件处理
M.disableFormat = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
end

-- M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
M.capabilities = require('cmp_nvim_lsp').default_capabilities()

M.flags = {
  debounce_text_changes = 150,
}

return M
