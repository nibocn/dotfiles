call plug#begin('~/.local/share/nvim/plugged')

" Theme ============================================={{{
Plug 'morhetz/gruvbox'
let g:gruvbox_italic=1
" }}}

" Vim 启动界面插件
Plug 'mhinz/vim-startify'

" 中文输入法自动切换
Plug 'ybian/smartim'

" Airline（状态栏） ==========================================={{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
" }}}

" NERDTree（目录树） =========================================={{{
Plug 'scrooloose/nerdtree'
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
"" 在 nerdtree 中显示文件图标颜色
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"" 目录图标
Plug 'ryanoasis/vim-devicons'
"" 显示目录图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"" 设置图标前的间距
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"" 启用文件目录打开、关闭时的图标状态效果
let g:DevIconsEnableFoldersOpenClose = 1
" }}}

" IndentLine（代码缩进） ========================================{{{
Plug 'Yggdroot/indentLine'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
"" 展开 NerdTree 时禁用掉 indentLine，因为启用 indentLine_leadingSpaceEnabled
"" 参数时会导致 NerdTree 文件缩进出现问题
let g:indentLine_bufNameExclude = ['NERD_tree.*']
nnoremap <leader>it :IndentLinesToggle<CR>
" }}}

" 文件搜索
Plug 'Yggdroot/LeaderF', {'do': './install.sh' }

" 光标快速跳转 =================================================={{{
Plug 'easymotion/vim-easymotion'
"" 智能匹配大小写
let g:EasyMotion_smartcase = 1
" }}}

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" Markdown ======================================================{{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
" }}}

" PlantUML ======================================================{{{
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }
Plug 'tyru/open-browser.vim', { 'for': 'plantuml' }
" }}}

" undo =========================================================={{{
Plug 'mbbill/undotree'
if has("persistent_undo")
  set undodir=~/.undodir
  set undofile
endif
" }}}

" Coc ==========================================================={{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"" use <leader>/ for trigger completion
inoremap <silent><expr> <leader>/ coc#refresh()
let g:coc_snippet_next = '<c-f>'
let g:coc_snippet_prev = '<c-b>'
" }}}

call plug#end()

colorscheme gruvbox

" vim: set fdl=0 fdm=marker:
