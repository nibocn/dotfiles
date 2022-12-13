local common_config = require('lsp.common-config')
local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_attach = function(client, bufnr)
    common_config.disableFormat(client)
    common_config.keyAttach(bufnr)
  end,
  settings = {
    css = {
      validate = true,
      -- tailwindcss
      lint = {
        unknownAtRules = 'ignore',
      },
    },
    less = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
    scss = {
      validate = true,
      lint = {
        unknownAtRules = 'ignore',
      },
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
