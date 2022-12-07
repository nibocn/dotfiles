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
  end,
})
