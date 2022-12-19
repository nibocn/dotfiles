local common_config = require('lsp.common-config')
local util = require('lspconfig.util')

local function get_python_path(workspace)
  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return util.path.join(vim.env.VIRTUAL_ENV, 'bin', 'python')
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(util.path.join(workspace, 'Pipfile'))
  if match ~= '' then
    local venv = vim.fn.trim(vim.fn.system('PIPENV_PIPFILE=' .. match .. ' pipenv --venv'))
    return util.path.join(venv, 'bin', 'python')
  end

  -- Fallback to system Python.
  return vim.fn.exepath('python3') or vim.fn.exepath('python') or 'python'
end

local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_init = function(client)
    client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
  end,
  on_attach = function(client, bufnr)
    common_config.disableFormat(client)
    common_config.keyAttach(bufnr)
  end,
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
