" ************************************* 插件定义 *****************************************
if g:editor == 'neovim'
  let $PLUG_VIM_FILE = '$HOME/.local/share/nvim/site/autoload/plug.vim'
  let $PLUG_HOME = '$HOME/.local/share/nvim/plugged'
else
  let $PLUG_VIM_FILE = '$HOME/.vim/autoload/plug.vim'
  let $PLUG_HOME = '$HOME/.vim/plugged'
endif

if empty(glob($PLUG_VIM_FILE))
  silent! exec ':!curl -fLo '.$PLUG_VIM_FILE.' --create-dirs '
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin($PLUG_HOME)

" 美化 ============================================ {{{
"" 主题
"" Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}
"" Plug 'morhetz/gruvbox'
"" Plug '/Users/richard/Workspace/Vim/themes/gruvbox-material.vim', {'as': 'gruvbox-material'}
Plug 'nibocn/gruvbox-material.vim', {'as': 'gruvbox-material'}
"" 目录图标
"" Plug 'ryanoasis/vim-devicons'
" }}}

Plug 'sheerun/vim-polyglot'

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
"" Plug 'preservim/nerdtree'
"" "" 在 nerdtree 中显示文件图标颜色
"" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"" 在 nerdtree 中集成 git
"" Plug 'Xuyuanp/nerdtree-git-plugin'
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
"" 常用代码片段
Plug 'honza/vim-snippets'
"" Tag list
Plug 'liuchengxu/vista.vim'
" }}}

" 高亮当前光标单词
Plug 'itchyny/vim-cursorword'
" 统计匹配单词数
Plug 'google/vim-searchindex'

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

"" gruvbox_material config {{{
"" let g:gruvbox_material_background='hard'
"" let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_enable_bold=1
"" let g:gruvbox_material_visual='reverse'
colorscheme gruvbox-material
"" colorscheme gruvbox
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

" NERDTree =========================================={{{
"" nnoremap <leader>nf :NERDTreeFind<CR>
"" nnoremap <leader>nt :NERDTreeToggle<CR>
"" function! s:nerdtree_init()
""   setl signcolumn=no
""   setl relativenumber
"" endfunction
"" autocmd FileType nerdtree call s:nerdtree_init()
" }}}

" Devicons ======================================== {{{
"" 显示目录图标
"" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"" "" 设置图标前的间距
"" "" let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
"" "" 启用文件目录打开、关闭时的图标状态效果
"" let g:DevIconsEnableFoldersOpenClose = 1
" }}}

" IndentLine ===================================== {{{
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
"" 因为启用 indentLine_leadingSpaceEnabled 参数导致部分插件冲突，故排除
let g:indentLine_bufNameExclude = ['\[coc-explorer.*', 'NERD_tree.*']
let g:indentLine_fileTypeExclude = ['markdown']
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
"" silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-lists', 'coc-snippets', 'coc-explorer', 'coc-git']

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

"" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <silent> <C-a>c :CocCommand<CR>

"" coc-git config {{{
nmap <C-a>gn <Plug>(coc-git-nextchunk)
nmap <C-a>gp <Plug>(coc-git-prevchunk)
nmap <C-a>gi <Plug>(coc-git-chunkinfo)
"" }}}

" }}}

" Vista.vim ===================================================== {{{
let g:vista_sidebar_width=50
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
  \   "function": "\uf794",
  \   "variable": "\uf71b",
  \ }
" }}}

" FZF =========================================================== {{{
nnoremap <leader>p :Files<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>t :BTags<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>l :Lines<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" }}}

" Lightline ===================================================== {{{
"" 'colorscheme': 'wombat'
let g:lightline = {
  \ 'colorscheme': 'gruvbox_material',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['git_global_status', 'readonly', 'filename', 'modified'],
  \   ],
  \   'right': [
  \     ['lineinfo'],
  \     ['percent'],
  \     ['git_buffer_status', 'fileformat', 'fileencoding', 'filetype']
  \   ]
  \ },
  \ 'component_function': {
  \   'git_global_status': 'LightlineGitGlobalStatus',
  \   'git_buffer_status': 'LightlineGitBufferStatus',
  \ }
\ }

function! LightlineGitGlobalStatus() abort
  return get(g:, 'coc_git_status', '')
endfunction
function! LightlineGitBufferStatus() abort
  return get(b:, 'coc_git_status', '')
endfunction
" }}}

" vim: set fdl=0 fdm=marker:
