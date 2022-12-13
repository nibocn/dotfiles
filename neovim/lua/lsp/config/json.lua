local common_config = require('lsp.common-config')
local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_attach = function(client, bufnr)
    -- use fixjson to format
    -- https://github.com/rhysd/fixjson
    common_config.disableFormat(client)
    common_config.keyAttach(bufnr)
  end,
  -- settings = {
  --   json = {
  --     schemas = require('schemastore').json.schemas(),
  --   },
  -- },
}

return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
