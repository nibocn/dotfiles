call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'
" 中文输入法自动切换
Plug 'ybian/smartim'
" Airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" }}}
" Vim 启动界面插件
Plug 'mhinz/vim-startify'
" 目录树插件 {{{
"" 显示目录树插件
Plug 'scrooloose/nerdtree'
"" 在 nerdtree 中显示文件图标颜色
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}
" 显示各类文件图标
Plug 'ryanoasis/vim-devicons'
" 代码缩进线
Plug 'Yggdroot/indentLine'
" 代码补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 搜索 {{{
"" Plug '/usr/local/opt/fzf'
"" Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', {'do': './install.sh' }
" }}}
" 光标快速跳转
Plug 'easymotion/vim-easymotion'
" .editorconfig plugin
Plug 'editorconfig/editorconfig-vim'
" Markdown plugin
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }

call plug#end()


" 配置主题 {{{
let g:gruvbox_italic=1
colorscheme gruvbox
" }}}


" Airline 配置 {{{
let g:airline_powerline_fonts=1
" }}}

" NERDTree {{{
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
" }}}

" vim-devicons {{{
"" 显示目录图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"" 设置图标前的间距
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"" 启用文件目录打开、关闭时的图标状态效果
let g:DevIconsEnableFoldersOpenClose = 1
" }}}

" indentLine {{{
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
"" 展开 NerdTree 时禁用掉 indentLine，因为启用 indentLine_leadingSpaceEnabled
"" 参数时会导致 NerdTree 文件缩进出现问题
let g:indentLine_bufNameExclude = ['NERD_tree.*']
nnoremap <leader>it :IndentLinesToggle<CR>
" }}}

" coc config {{{
"" use <leader>/ for trigger completion
inoremap <silent><expr> <leader>/ coc#refresh()
let g:coc_snippet_next = '<c-f>'
let g:coc_snippet_prev = '<c-b>'
" }}}

" easymotion {{{
"" 智能匹配大小写
let g:EasyMotion_smartcase = 1
" }}}

" fzf {{{
"" nnoremap <C-p> :Files<CR>
" }}}
