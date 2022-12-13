local status, typescript = pcall(require, 'typescript')
if not status then
  vim.notify('没有找到 typescript')
  return
end

local common_config = require('lsp.common-config')
local opts = {
  capabilities = common_config.capabilities,
  flags = common_config.flags,
  on_attach = function(client, bufnr)
    -- common.disableFormat(client)
    common_config.keyAttach(bufnr)

    --[[ 
        :TypescriptOrganizeImports
        :TypescriptRenameFile
        :TypescriptAddMissingImports
        :TypescriptRemoveUnused
        :TypescriptFixAll
        :TypescriptGoToSourceDefinition 
    ]]
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gs', ':TypescriptOrganizeImports<CR>', bufopts)
    vim.keymap.set('n', 'gR', ':TypescriptRenameFile<CR>', bufopts)
    vim.keymap.set('n', 'gi', ':TypescriptAddMissingImports<CR>', bufopts)
    vim.keymap.set('n', 'gu', ':TypescriptRemoveUnused<CR>', bufopts)
    vim.keymap.set('n', 'gf', ':TypescriptFixAll<CR>', bufopts)
    vim.keymap.set('n', 'gD', ':TypescriptGoToSourceDefinition<CR>', bufopts)
  end,
}
return {
  on_setup = function(_)
    typescript.setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
      },
      server = opts,
    })
  end,
}
