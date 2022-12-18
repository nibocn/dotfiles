local autocmd = vim.api.nvim_create_autocmd
local jdtlsGroup = vim.api.nvim_create_augroup('jdtlsGroup', { clear = true })

local function initiateJDTLS()
  local common_config = require('lsp.common-config')
  local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
  local workspace_dir = '/Users/richard/.cache/jdtls/' .. project_name
  local config = {
    capabilities = common_config.capabilities,
    flags = common_config.flags,
    on_attach = function(_, bufnr)
      -- common_config.disableFormat(client)
      require('jdtls.setup').add_commands()
      common_config.keyAttach(bufnr)
    end,
    cmd = {
      'java', -- or '/path/to/java17_or_newer/bin/java'
      --         -- depends on if `java` is in your $PATH env variable and if it points to the right version.

      '-Declipse.application=org.eclipse.jdt.ls.core.id1',
      '-Dosgi.bundles.defaultStartLevel=4',
      '-Declipse.product=org.eclipse.jdt.ls.core.product',
      '-Dlog.protocol=true',
      '-Dlog.level=ALL',
      '-Xms1g',
      '--add-modules=ALL-SYSTEM',
      '--add-opens',
      'java.base/java.util=ALL-UNNAMED',
      '--add-opens',
      'java.base/java.lang=ALL-UNNAMED',
      '-javaagent:/usr/local/share/lombok/lombok.jar',
      '-jar',
      vim.fn.glob(
        '/usr/local/share/eclipse/jdt-language-server/plugins/org.eclipse.equinox.launcher_*.jar'
      ),
      -- '/usr/local/share/eclipse/jdt-language-server/bin/jdtls',
      -- '--jvm-arg=-javaagent:/usr/local/share/lombok/lombok.jar',
      '-data',
      workspace_dir,
      '-configuration',
      '/usr/local/share/eclipse/jdt-language-server/config_mac',
    },
    -- root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    -- root_dir = vim.fs.dirname(vim.fs.find({ '.gradlew', '.git', 'mvnw' }, { upward = true })[1]),
  }
  require('jdtls').start_or_attach(config)
end

autocmd('FileType', {
  group = jdtlsGroup,
  pattern = 'java',
  callback = function()
    initiateJDTLS()
  end,
})
