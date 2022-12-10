local status, cmp = pcall(require, 'cmp')
local keybindings = require('keybindings')
if not status then
  vim.notify('没有找到 nvim-cmp')
  return
end

cmp.setup({
  -- 指定 snippet 引擎
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body)

      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body)

      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body)
    end,
  },
  window = {
    -- 弹出窗体显示边框
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  -- 快捷键映射
  mapping = keybindings.cmp(cmp),
  -- 使用 lspkind-nvim 显示类型图标
  formatting = require('lsp.lspkind').formatting,
  -- 补全源
  sources = cmp.config.sources({
    {
      name = 'nvim_lsp',
      group_index = 1,
    },
    {
      name = 'vsnip',
      group_index = 1,
    },
    {
      name = 'buffer',
      group_index = 2,
    },
    {
      name = 'path',
      group_index = 2,
    },
  }),
})

-- / 查找模式使用 buffer 源
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- : 命令行模式中使用 path 和 cmdline 源.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

cmp.setup.filetype({ "markdown", "help" }, {
  sources = { {
    name = 'vsnip',
  }, {
    name = 'buffer',
  }, {
    name = 'path',
  } },
})
