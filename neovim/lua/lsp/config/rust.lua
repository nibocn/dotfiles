local common_config = require('lsp.common-config')
local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_attach = function(client, bufnr)
    common_config.disableFormat(client)
    common_config.keyAttach(bufnr)
  end,
  settings = {
    -- to enable rust-analyzer settings visit:
    -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
    ['rust-analyzer'] = {
      -- enable clippy on save
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
}

return {
  on_setup = function(server)
    server.setup(opts)
    -- local ok_rt, rust_tools = pcall(require, 'rust-tools')
    -- if not ok_rt then
    --   print('Failed to load rust tools, will set up `rust_analyzer` without `rust-tools`.')
    --   server.setup(opts)
    -- else
    --   -- We don't want to call lspconfig.rust_analyzer.setup() when using rust-tools
    --   rust_tools.setup({
    --     server = opts,
    --     dap = require('dap.nvim-dap.config.rust'),
    --   })
    -- end
  end,
}
