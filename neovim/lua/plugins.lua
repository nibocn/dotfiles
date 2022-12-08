local packer = require("packer")
packer.startup({
  function(use)
    use ("wbthomason/packer.nvim")
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
  end,
})
