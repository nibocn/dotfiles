local opts = {
  filetypes = { 'html', 'javascript', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
