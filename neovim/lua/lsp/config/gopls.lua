local common_config = require('lsp.common-config')
local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_attach = function(client, bufnr)
    common_config.keyAttach(bufnr)
    -- common_config.disableFormat(client)
  end,
  -- https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
