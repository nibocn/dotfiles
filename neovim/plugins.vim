call plug#begin('~/.local/share/nvim/plugged')

" 美化 ============================================ {{{
"" 主题
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
"" 目录图标
Plug 'ryanoasis/vim-devicons'
" }}}

" 启动页面
Plug 'mhinz/vim-startify'
" 中文输入法自动切换
Plug 'ybian/smartim'

" 状态栏 =============================== {{{
"" Plug 'vim-airline/vim-airline'
"" Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'
" }}}

" 文件导航 ========================================== {{{
Plug 'scrooloose/nerdtree'
"" 在 nerdtree 中显示文件图标颜色
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" }}}

" 搜索 ============================================== {{{
Plug 'junegunn/fzf.vim'
" }}}

" 代码基础插件 ========================================{{{
"" IndentLine 代码缩进显示
Plug 'Yggdroot/indentLine'
"" editorconfig
Plug 'editorconfig/editorconfig-vim'
"" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}

" 基础编辑 =========================================== {{{
"" 光标快速跳转
Plug 'easymotion/vim-easymotion'
"" 编辑历史回退
Plug 'mbbill/undotree'
" }}}

" Markdown ======================================================{{{
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown' }
" }}}

" PlantUML ======================================================{{{
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }
Plug 'weirongxu/plantuml-previewer.vim', { 'for': 'plantuml' }
Plug 'tyru/open-browser.vim', { 'for': 'plantuml' }
" }}}

call plug#end()

" Theme ============================================={{{
set termguicolors
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

"" gruvbox_material config {{{
"" let g:gruvbox_material_background='hard'
colorscheme gruvbox-material
let g:gruvbox_material_enable_italic=1
hi Search cterm=reverse ctermfg=172 ctermbg=235 gui=reverse guifg=#d78700 guibg=#282828
hi IncSearch cterm=reverse ctermfg=166 ctermbg=235 gui=reverse guifg=#d75f00 guibg=#282828
hi Visual cterm=reverse ctermbg=241 gui=reverse guibg=#665c54
"" }}}

" }}}

" Vim 启动界面插件 {{{
let g:startify_commands = [
      \ {'up': ['Update Plugins', ':PlugUpdate']},
      \ {'ug': ['Upgrade Plugin Manager', ':PlugUpgrade']}
      \ ]
let g:startify_bookmarks = [
      \ {'c': '~/.local/dotfiles'},
      \ {'gf': '~/Library/Mobile Documents/iCloud~com~nssurge~inc/Documents/cordcloud.conf'}
      \ ]
autocmd User Startified setlocal cursorline
nnoremap <leader>st :Startify<CR>
" }}}

" Airline ==========================================={{{
"" let g:airline_powerline_fonts = 1
"" let g:airline_theme='wombat'
"" let g:airline_powerline_fonts = 1
"" "" 打开 buffer
"" let g:airline#extensions#tabline#enabled = 1
"" let g:airline#extensions#tabline#formatter = 'unique_tail'
"" let g:airline#extensions#tabline#show_tab_nr = 1
"" let g:airline#extensions#tabline#tab_nr_type= 2
"" let g:airline#extensions#tabline#show_tab_type = 1
"" "" let g:airline#extensions#tabline#tabs_label = 'TABS'
"" "" tabline 分隔符
"" let g:airline#extensions#tabline#left_alt_sep = '➤'
"" let g:airline#extensions#tabline#buffer_nr_show = 1
" }}}

" NERDTree =========================================={{{
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
" }}}

" Devicons ======================================== {{{
"" 显示目录图标
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"" 设置图标前的间距
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"" 启用文件目录打开、关闭时的图标状态效果
let g:DevIconsEnableFoldersOpenClose = 1
" }}}

" IndentLine ===================================== {{{
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
"" 展开 NerdTree 时禁用掉 indentLine，因为启用 indentLine_leadingSpaceEnabled
"" 参数时会导致 NerdTree 文件缩进出现问题
let g:indentLine_bufNameExclude = ['NERD_tree.*']
nnoremap <leader>it :IndentLinesToggle<CR>
" }}}

" EasyMotion ===================================== {{{
"" 智能匹配大小写
let g:EasyMotion_smartcase = 1
" }}}

" undo =========================================================={{{
if has("persistent_undo")
  set undodir=~/.undodir
  set undofile
endif
" }}}

" Coc =========================================================== {{{
"" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-lists']
"" 使用 <tab> 触发补全
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()

" let g:coc_snippet_next = '<c-f>'
" let g:coc_snippet_prev = '<c-b>'
" }}}

" FZF =========================================================== {{{
set rtp+=/usr/local/opt/fzf
nnoremap <leader>p :FZF<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>b :Buffers<CR>
" }}}

" Lightline ===================================================== {{{
"" 'colorscheme': 'wombat'
let g:lightline = {
  \ 'colorscheme': 'gruvbox_material',
\ }
" }}}

" vim: set fdl=0 fdm=marker:
