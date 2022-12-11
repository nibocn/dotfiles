local status, null_ls = pcall(require, 'null-ls')

if not status then
  vim.notify('没有找到 null-ls')
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
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
  },
  -- 保存自动格式化
  -- on_attach = function(_)
  --   vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format { async = true }')
  -- end,
})
