local packer = require("packer")
packer.startup({
  function(use)
    use ("wbthomason/packer.nvim")
    -- 缓存lua模块（加快 neovim 启动效率）{{{
    use ('lewis6991/impatient.nvim')
    -- }}}
    -- 主题 {{{
    use("sainnhe/edge")
    use("sainnhe/sonokai")
    use("sainnhe/everforest")
    -- }}}
    -- 文件导航 {{{
    use("nvim-tree/nvim-tree.lua")
    -- }}}
    -- bufferline {{{
    use({ "akinsho/bufferline.nvim", requires = { "moll/vim-bbye" }})
    -- }}}
    -- lualine {{{
    use("nvim-lualine/lualine.nvim")
    use("arkav/lualine-lsp-progress")
    -- }}}
    -- telescope {{{
    use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
    -- telescope project extensions
    use('ahmedkhalf/project.nvim')
    -- }}}
    -- dashboard {{{
    use { 'glepnir/dashboard-nvim' }
    -- }}}
    -- nvim-treesitter {{{
    use { 'nvim-treesitter/nvim-treesitter',
          run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
          end,
    }
    -- }}}
    -- LSP {{{
    --- installer
    use({ 'williamboman/mason.nvim' })
    use({ 'williamboman/mason-lspconfig.nvim' })
    -- Lspconfig
    use({ 'neovim/nvim-lspconfig' })
    -- }}}
    -- 代码补全相关 {{{
    --- 补全引擎
    use({ 'hrsh7th/nvim-cmp' })
    -- 代码片段 snippet 引擎
    use({ 'hrsh7th/vim-vsnip' })
    -- 补全源
    use({ 'hrsh7th/cmp-vsnip' })
    use({ 'hrsh7th/cmp-nvim-lsp' }) -- { name = nvim_lsp }
    use({ 'hrsh7th/cmp-buffer' }) -- { name = 'buffer' },
    use({ 'hrsh7th/cmp-path' }) -- { name = 'path' }
    use({ 'hrsh7th/cmp-cmdline' }) -- { name = 'cmdline' }
    -- 常见编程语言代码片段
    use({ 'rafamadriz/friendly-snippets' })
    -- 代码补全类型提示图标
    use({ 'onsails/lspkind-nvim' })
    -- }}}
  end,
})
