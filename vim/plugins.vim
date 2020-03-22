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
" 主题
Plug 'nibocn/gruvbox-material.vim', {'as': 'gruvbox-material'}
" }}}

Plug 'sheerun/vim-polyglot'

" 启动页面
Plug 'mhinz/vim-startify'
" 中文输入法自动切换
Plug 'ybian/smartim'

" 状态栏 =============================== {{{
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" }}}

" 搜索 ============================================== {{{
Plug 'junegunn/fzf.vim'
" }}}

" 代码基础插件 ========================================{{{
" IndentLine 代码缩进显示
Plug 'Yggdroot/indentLine'
" editorconfig
Plug 'editorconfig/editorconfig-vim'
" 自动补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 常用代码片段
Plug 'honza/vim-snippets'
" Tag list
Plug 'liuchengxu/vista.vim'
" 异步任务
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
" }}}

" 高亮当前光标单词
Plug 'itchyny/vim-cursorword'
" 统计匹配单词数
Plug 'google/vim-searchindex'

" 基础编辑 =========================================== {{{
" 光标快速跳转
Plug 'easymotion/vim-easymotion'
" 编辑历史回退
Plug 'mbbill/undotree'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdcommenter'
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

Plug 'liuchengxu/vim-which-key'

call plug#end()


" Theme ============================================={{{
set termguicolors
set background=dark

" gruvbox_material config {{{
" let g:gruvbox_material_background='hard'
" let g:gruvbox_material_disable_italic_comment=1
let g:gruvbox_material_enable_italic=1
let g:gruvbox_material_enable_bold=1
" let g:gruvbox_material_visual='reverse'
colorscheme gruvbox-material
" colorscheme gruvbox
" }}}

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
" nnoremap <leader>st :Startify<CR>
" }}}

" vim-polyglot =================================== {{{
let g:polyglot_disabled = ['csv']
" }}}

" IndentLine ===================================== {{{
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
" 因为启用 indentLine_leadingSpaceEnabled 参数导致部分插件冲突，故排除
let g:indentLine_bufNameExclude = ['\[coc-explorer.*', 'NERD_tree.*']
let g:indentLine_fileTypeExclude = ['markdown']
" }}}

" EasyMotion ===================================== {{{
" 智能匹配大小写
let g:EasyMotion_smartcase = 1
" }}}

" undo =========================================================={{{
if has("persistent_undo")
  set undodir=~/.undodir
  set undofile
endif
" }}}

" Coc =========================================================== {{{
" fix the most annoying bug that coc has
silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
let g:coc_global_extensions = [
  \   'coc-lists', 'coc-json', 'coc-git', 'coc-snippets', 'coc-explorer',
  \   'coc-vimlsp',
  \   'coc-python',
  \   'coc-html', 'coc-css', 'coc-tsserver', 'coc-tailwindcss', 'coc-stylelint', 'coc-tslint'
  \ ]

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

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <silent> <C-\>cc :CocCommand<CR>
nnoremap <silent> <C-\>cl :CocList<CR>

" coc-git config {{{
nmap <silent> <C-\>gn <Plug>(coc-git-nextchunk)
nmap <silent> <C-\>gp <Plug>(coc-git-prevchunk)
nmap <silent> <C-\>gi <Plug>(coc-git-chunkinfo)
"   }}}

nmap <silent> <C-\>dn <Plug>(coc-diagnostic-next)
nmap <silent> <C-\>dp <Plug>(coc-diagnostic-prev)

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

" asynctasks ==================================================== {{{
" asyncrun 运行时设置 quickfix 打开的高度
let g:asyncrun_open = 8
" 设置用来标记项目根目录的文件夹
let g:asyncrun_rootmarks = [ '.git', '.svn', '.root', '.project', '.hg' ]
" 在下方打开可复用内部终端
let g:asynctasks_term_pos = 'bottom'
" 显示分屏内置终端时不切换焦点
let g:asynctasks_term_focus = 0
" 将内置终端的 buffer 设置为 bufhidden
let g:asynctasks_term_hideen = 1
let g:asynctasks_term_listed = 0
nnoremap <silent><C-\>r :AsyncTask file-run<CR>
nnoremap <silent><C-\>b :AsyncTask file-build<CR>
" }}}

" FZF =========================================================== {{{
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)

" }}}

" nerdcommenter ================================================= {{{
let g:NERDCreateDefaultMappings = 0
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDCustomDelimiters = {
  \ 'python': { 'left': '#', 'right': '' }
\ }
" }}}

" vim-which-key ================================================= {{{
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" nnoremap <silent> <localleader> :WhichKey ','<CR>
let g:which_key_map = {}

let g:which_key_map['?'] = ['Maps', 'show-deybindings']
let g:which_key_map[';'] = ['<Plug>NERDCommenterToggle', 'commenter']
let g:which_key_map['q'] = ['q', 'quit']
let g:which_key_map['Q'] = [':qa!', 'quit-without-saving']

let g:which_key_map.f = {
  \ 'name': '+find/files/fold',
  \ 's': ['update', 'save file'],
  \ 'p': ['Files', 'fzf'],
  \ 'e': [':CocCommand explorer', 'file folder']
\ }
let g:which_key_map.t = {
  \ 'name': '+toggle/tag',
  \ 't': ['Vista', 'vista tagbar'],
  \ 'b': ['BTags', 'fzf buffer tag'],
  \ 'T': ['Tags', 'fzf global tag'],
  \ 'i': ['IndentLinesToggle', 'indentLine']
\ }
let g:which_key_map.b = {
  \ 'name': '+buffer',
  \ 'b': ['Buffers', 'fzf buffer'],
  \ '?': ['Buffers', 'fzf buffer'],
  \ 'd': ['bdelete', 'delete current buffer'],
  \ 'n': ['bnext', 'next buffer'],
  \ 'p': ['bprevious', 'previous buffer'],
  \ 'f': ['bfirst', 'first buffer'],
  \ 'l': ['blast', 'last buffer'],
\ }
let g:which_key_map.s = {
  \ 'name': '+search/show',
  \ 'a': ['Ag', 'fzf ag'],
  \ 'l': ['Lines', 'fzf lines']
\ }

call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>WhichKeyVisual '<Space>'<CR>
" }}}

" Lightline ===================================================== {{{
" 'colorscheme': 'wombat'

function! CocCurrentFunction()
  return get(b:, 'coc_current_function', '')
endfunction
function! Tab_num(n) abort
  return a:n." \ue0bb"
endfunction

function! LightlineGitGlobalStatus() abort
  return get(g:, 'coc_git_status', '')
endfunction
function! LightlineGitBufferStatus() abort
  return get(b:, 'coc_git_status', '')
endfunction

set laststatus=2
set showtabline=2
set noshowmode
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost * call lightline#update()
augroup END

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox_material'
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be" }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba" }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#bufferline#unicode_symbols = 1

let g:lightline.active = {
  \ 'left': [
  \   [ 'mode', 'paste' ],
  \   [ 'readonly', 'filename', 'modified' ]
  \ ],
  \ 'right': [
  \   [ 'lineinfo' ],
  \   ['fileformat', 'filetype']
  \ ]
\ }
let g:lightline.inactive = {
  \ 'left': [ [ 'filename' , 'modified', 'fileformat' ] ],
  \ 'right': [ [ 'lineinfo' ] ]
\ }
let g:lightline.tabline = {
  \ 'left': [ [ 'vim_logo', 'buffers' ] ],
  \ 'right': [
  \   [ 'gitbranch' ],
  \   [ 'gitstatus' ],
  \ ]
\ }
let g:lightline.component = {
  \ 'bufinfo': '%{bufname("%")}:%{bufnr("%")}',
  \ 'vim_logo': "\ue7c5",
  \ 'pomodoro': '%{PomodoroStatus()}',
  \ 'mode': '%{lightline#mode()}',
  \ 'absolutepath': '%F',
  \ 'relativepath': '%f',
  \ 'filename': '%t',
  \ 'filesize': "%{HumanSize(line2byte('$') + len(getline('$')))}",
  \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
  \ 'fileformat': '%{&fenc!=#""?&fenc:&enc}[%{&ff}]',
  \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
  \ 'modified': '%M',
  \ 'bufnum': '%n',
  \ 'paste': '%{&paste?"PASTE":""}',
  \ 'readonly': '%R',
  \ 'charvalue': '%b',
  \ 'charvaluehex': '%B',
  \ 'percent': '%2p%%',
  \ 'percentwin': '%P',
  \ 'spell': '%{&spell?&spelllang:""}',
  \ 'lineinfo': '%2p%% %3l:%-2v',
  \ 'line': '%l',
  \ 'column': '%c',
  \ 'close': '%999X X ',
\ }
let g:lightline.component_function = {
  \ 'gitbranch': 'LightlineGitGlobalStatus',
  \ 'coc_status': 'coc#status',
  \ 'gitstatus': 'LightlineGitBufferStatus',
\ }
let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
\ }
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
\ }

" 更新状态栏
" autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
" }}}

" vim: set fdl=0 fdm=marker:
