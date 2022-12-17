local status, null_ls = pcall(require, 'null-ls')

if not status then
  vim.notify('没有找到 null-ls')
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
  debug = false,
  sources = {
    -- brew install stylua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({
      filetypes = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact',
        'vue',
        'css',
        'scss',
        'less',
        'html',
        'json',
        'yaml',
        'graphql',
      },
      prefer_local = 'node_modules/.bin',
    }),

    -- Diagnostics  ---------------------
    -- diagnostics.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
    -- npm install -g eslint_d
    diagnostics.eslint_d.with({
      prefer_local = 'node_modules/.bin',
    }),

    -- code actions ---------------------
    -- code_actions.gitsigns,
    -- code_actions.eslint.with({
    --   prefer_local = "node_modules/.bin",
    -- }),
    -- npm install -g eslint_d
    code_actions.eslint_d.with({
      prefer_local = 'node_modules/.bin',
    }),
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  -- 提示格式： [eslint] xxx
  diagnostics_format = '[#{s}] #{m}',
  -- 保存自动格式化
  -- on_attach = function(_)
  --   vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }')
  -- end,
})
