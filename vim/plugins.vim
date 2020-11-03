scriptencoding utf-8

" ************************************* 插件定义 *****************************************
let $PLUG_HOME = '$HOME/.local/share/nvim/plugged'
if g:editor ==# 'neovim'
  let $PLUG_VIM_FILE = '$HOME/.local/share/nvim/site/autoload/plug.vim'
else
  let $PLUG_VIM_FILE = '$HOME/.vim/autoload/plug.vim'
endif

if empty(glob($PLUG_VIM_FILE))
  silent! exec ':!curl -fLo '.$PLUG_VIM_FILE.' --create-dirs '
    \ 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  augroup plug
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup end
endif

call plug#begin($PLUG_HOME)

" 美化 ============================================ {{{
" 主题
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'sainnhe/forest-night'
Plug 'sainnhe/sonokai'
" }}}

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
" Tag manage
Plug 'ludovicchabant/vim-gutentags'
" 异步任务
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'dense-analysis/ale'
Plug 'maximbaz/lightline-ale'
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

Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }

" Vimscript test
Plug 'junegunn/vader.vim', { 'for': 'vader' }

" TypeScript & JSX TypeScript
Plug 'leafgarland/typescript-vim', { 'for': ['typescript', 'typescript.tsx'] }
Plug 'peitalin/vim-jsx-typescript', { 'for': 'typescript.tsx' }
" JSX React
Plug 'chemzqm/vim-jsx-improve', { 'for': 'javascriptreact' }

call plug#end()


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
function! LightlineRelateivePath() abort
  let relativepath = expand('%:f') !=# '' ? expand('%:f') : '[No Name]'
  let modified = &modified ? ' ✎' : ''
  let readonly = &readonly ? ' ' : ''
  return relativepath . readonly . modified
endfunction

function! LightlineFilename() abort
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' ✎' : ''
  let readonly = &readonly ? ' ' : ''
  return filename . readonly . modified
endfunction

set laststatus=2
set showtabline=2
set noshowmode
augroup lightlineCustom
  autocmd!
  autocmd BufWritePost,BufRead * call lightline#update()
augroup END

let g:lightline = {}
" let g:lightline.colorscheme = 'gruvbox_material'
" let g:lightline.colorscheme = 'edge'
let g:lightline.separator = { 'left': "\ue0b8", 'right': "\ue0be " }
let g:lightline.subseparator = { 'left': "\ue0b9", 'right': "\ue0b9" }
let g:lightline.tabline_separator = { 'left': "\ue0bc", 'right': "\ue0ba " }
let g:lightline.tabline_subseparator = { 'left': "\ue0bb", 'right': "\ue0bb" }
let g:lightline#bufferline#unicode_symbols = 1
" 只显示 buffer 页签文件名不显示路径
let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline#ale#indicator_checking = "\uf110"
let g:lightline#ale#indicator_infos = "\uf129 "
let g:lightline#ale#indicator_warnings = "\uf421 "
let g:lightline#ale#indicator_errors = "\uf65b "
let g:lightline#ale#indicator_ok = "\uf118"

let g:lightline.active = {
  \ 'left': [
  \   [ 'mode', 'paste' ],
  \   [ 'filename', 'fileformat', 'filetype' ],
  \ ],
  \ 'right': [
  \   [ 'lineinfo' ],
  \   [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
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
  \ 'relativepath': 'LightlineRelateivePath',
  \ 'filename': 'LightlineFilename',
\ }
let g:lightline.component_expand = {
  \ 'buffers': 'lightline#bufferline#buffers',
  \ 'linter_checking': 'lightline#ale#checking',
  \ 'linter_infos': 'lightline#ale#infos',
  \ 'linter_warnings': 'lightline#ale#warnings',
  \ 'linter_errors': 'lightline#ale#errors',
  \ 'linter_ok': 'lightline#ale#ok',
\ }
let g:lightline.component_type = {
  \ 'buffers': 'tabsel',
  \ 'linter_errors': 'error',
  \ 'linter_warnings': 'warning',
\ }

" 更新状态栏
" autocmd BufWritePost,BufRead * call lightline#update()
" }}}

" Theme ============================================={{{
set termguicolors

" colorscheme ====================== {{{
let g:colorSchemeList = {}
let g:colorSchemeList['Forest Night'] = [
      \   'set background=dark',
      \   'let g:forest_night_enable_italic = 1',
      \   'let g:forest_night_disable_italic_comment = 0',
      \   "let g:forest_night_current_word = 'underline'",
      \   'colorscheme forest-night',
      \   'call SwitchLightlineColorScheme("forest_night")'
      \   ]
let g:colorSchemeList['Gruvbox Material Dark'] = [
      \   'set background=dark',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Gruvbox Material Dark Soft'] = [
      \   'set background=dark',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_background = 'soft'",
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Gruvbox Material Dark Hard'] = [
      \   'set background=dark',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_background = 'hard'",
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Gruvbox Material Light'] = [
      \   'set background=light',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Gruvbox Material Light Soft'] = [
      \   'set background=light',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_background = 'soft'",
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Gruvbox Material Light Hard'] = [
      \   'set background=light',
      \   'let g:gruvbox_material_enable_italic = 1',
      \   '"let g:gruvbox_material_disable_italic_comment = 1',
      \   'let g:gruvbox_material_enable_bold=1',
      \   "let g:gruvbox_material_background = 'hard'",
      \   "let g:gruvbox_material_current_word='underline'",
      \   'colorscheme gruvbox-material',
      \   'call SwitchLightlineColorScheme("gruvbox_material")'
      \   ]
let g:colorSchemeList['Edge Dark'] = [
      \   'set background=dark',
      \   '"let g:edge_disable_italic_comment = 1',
      \   'let g:edge_enable_italic = 1',
      \   "let g:edge_current_word='underline'",
      \   'colorscheme edge',
      \   'call SwitchLightlineColorScheme("edge")'
      \   ]
let g:colorSchemeList['Edge Dark Aura'] = [
      \   'set background=dark',
      \   "let g:edge_style='aura'",
      \   '"let g:edge_disable_italic_comment = 1',
      \   'let g:edge_enable_italic = 1',
      \   "let g:edge_current_word='underline'",
      \   'colorscheme edge',
      \   'call SwitchLightlineColorScheme("edge")'
      \   ]
let g:colorSchemeList['Edge Dark Neon'] = [
      \   'set background=dark',
      \   "let g:edge_style='neon'",
      \   '"let g:edge_disable_italic_comment = 1',
      \   'let g:edge_enable_italic = 1',
      \   "let g:edge_current_word='underline'",
      \   'colorscheme edge',
      \   'call SwitchLightlineColorScheme("edge")'
      \   ]
let g:colorSchemeList['Edge Light'] = [
      \   'set background=light',
      \   '"let g:edge_disable_italic_comment = 1',
      \   'let g:edge_enable_italic = 1',
      \   "let g:edge_current_word='underline'",
      \   'colorscheme edge',
      \   'call SwitchLightlineColorScheme("edge")'
      \   ]
let g:colorSchemeList['Sonokai Shusia'] = [
      \   "let g:sonokai_style = 'shusia'",
      \   '"let g:sonokai_disable_italic_comment = 1',
      \   'let g:sonokai_enable_italic = 1',
      \   'colorscheme sonokai',
      \   'call SwitchLightlineColorScheme("sonokai")'
      \   ]
let g:colorSchemeList['Sonokai Andromeda'] = [
      \   "let g:sonokai_style = 'andromeda'",
      \   '"let g:sonokai_disable_italic_comment = 1',
      \   'let g:sonokai_enable_italic = 1',
      \   'colorscheme sonokai',
      \   'call SwitchLightlineColorScheme("sonokai")'
      \   ]
let g:colorSchemeList['Sonokai Atlantis'] = [
      \   "let g:sonokai_style = 'atlantis'",
      \   '"let g:sonokai_disable_italic_comment = 1',
      \   'let g:sonokai_enable_italic = 1',
      \   'colorscheme sonokai',
      \   'call SwitchLightlineColorScheme("sonokai")'
      \   ]
let g:colorSchemeList['Sonokai Maia'] = [
      \   "let g:sonokai_style = 'maia'",
      \   '"let g:sonokai_disable_italic_comment = 1',
      \   'let g:sonokai_enable_italic = 1',
      \   'colorscheme sonokai',
      \   'call SwitchLightlineColorScheme("sonokai")'
      \   ]
" Functions ====================== {{{
function SwitchLightlineColorScheme(lightlineName) abort
  execute join(['source', globpath(&runtimepath, join(['autoload/lightline/colorscheme/', a:lightlineName, '.vim'], ''), 0, 1)[0]], ' ')
  let g:lightline.colorscheme = a:lightlineName
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction
function SwitchColorScheme(name) abort
  for l:item in g:colorSchemeList[a:name]
    execute l:item
  endfor
endfunction
function! s:Colo(a, l, p)
  return keys(g:colorSchemeList)
endfunction
command! -bar -nargs=? -complete=customlist,<sid>Colo Colo call SwitchColorScheme(<f-args>)
call SwitchColorScheme(g:vimColorScheme)
" }}}
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
augroup startify
  autocmd User Startified setlocal cursorline
augroup end
" nnoremap <leader>st :Startify<CR>
" }}}

" IndentLine ===================================== {{{
" 禁用 leadingSpace 因为当单行内容过长时会造成明显的移动和输入延迟
" let g:indentLine_leadingSpaceEnabled = 1
" let g:indentLine_leadingSpaceChar = '·'
" 因为启用 indentLine_leadingSpaceEnabled 参数导致部分插件冲突，故排除
let g:indentLine_bufNameExclude = ['\[coc-explorer.*', 'NERD_tree.*']
let g:indentLine_fileTypeExclude = ['markdown']

" }}}

" EasyMotion ===================================== {{{
" 智能匹配大小写
let g:EasyMotion_smartcase = 1
" }}}

" undo =========================================================={{{
set undodir=~/.undodir
set undofile
" }}}

" Coc =========================================================== {{{
let g:coc_global_extensions = [
  \   'coc-lists', 'coc-json', 'coc-git', 'coc-snippets', 'coc-explorer', 'coc-yank',
  \   'coc-vimlsp',
  \   'coc-python',
  \   'coc-html', 'coc-css', 'coc-emmet', 'coc-tsserver', 'coc-tailwindcss', 'coc-prettier',
  \   'coc-stylelint', 'coc-tslint', 'coc-eslint',
  \   'coc-java', 'coc-groovy'
  \ ]
" Tab 补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 回车确认补全
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" coc-git config {{{
nmap <silent> <leader>gj <Plug>(coc-git-nextchunk)
nmap <silent> <leader>gk <Plug>(coc-git-prevchunk)
nmap <silent> <leader>gi <Plug>(coc-git-chunkinfo)
nmap <silent> <leader>gc <Plug>(coc-git-commit)
nmap <silent> <leader>gu :<C-u>CocCommand git.chunkUndo<CR>
nmap <silent> <leader>ga :<C-u>CocCommand git.chunkStage<CR>
nmap <silent> <leader>gd :<C-u>CocCommand git.diffCached<CR>
nmap <silent> <leader>gs :<C-u>CocList gstatus<CR>
nmap <silent> <leader>glc :<C-u>CocList bcommits<CR>
nmap <silent> <leader>gla :<C-u>CocList commits<CR>
" }}}

nnoremap <silent> <leader>l<Space> :CocList<CR>
nnoremap <silent> <leader>lc :CocCommand<CR>
nmap <silent> <leader>ld <Plug>(coc-definition)
nmap <silent> <leader>lD <Plug>(coc-declaration)
nmap <silent> <leader>lt <Plug>(coc-type-definition)
nmap <silent> <leader>lr <Plug>(coc-references)
nmap <silent> <leader>lm <Plug>(coc-implementation)
nmap <silent> <leader>lR <Plug>(coc-rename)
nmap <silent> <leader>lf <Plug>(coc-format)
vmap <silent> <leader>lf <Plug>(coc-format-selected)
nmap <silent> <leader>lF <Plug>(coc-fix-current)
nmap <silent> <leader>la <Plug>(coc-codeaction-selected)
vmap <silent> <leader>la <Plug>(coc-codeaction-selected)
nmap <silent> <leader>lA <Plug>(coc-codelens-action)
nmap <silent> <leader>le <Plug>(coc-refactor)
nmap <silent> <leader>lv <Plug>(coc-range-select)
vmap <silent> <leader>lv <Plug>(coc-range-select)

" }}}

" Vista.vim ===================================================== {{{
let g:vista_sidebar_width=50
let g:vista_icon_indent = ['╰─▸ ', '├─▸ ']
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']
let g:vista_keep_fzf_colors = 1
let g:vista#renderer#enable_icon = 1
let g:vista#renderer#icons = {
  \ 'func': "\uf794",
  \ 'function': "\uf794",
  \ 'functions': "\uf794",
  \ 'var': "\uf71b",
  \ 'variable': "\uf71b",
  \ 'variables': "\uf71b",
  \ 'const': "\uf8ff",
  \ 'constant': "\uf8ff",
  \ 'methods': "\uf6a6",
  \ 'package': "\ue612",
  \ 'packages': "\ue612",
  \ 'enum': "\uf702",
  \ 'enumerator': "\uf702",
  \ 'module': "\uf136",
  \ 'modules': "\uf136",
  \ 'type': "\uf7fd",
  \ 'typedef': "\uf7fd",
  \ 'types': "\uf7fd",
  \ 'field': "\uf30b",
  \ 'fields': "\uf30b",
  \ 'macro': "\uf8a3",
  \ 'macros': "\uf8a3",
  \ 'map': "\ufb44",
  \ 'maps': "\ufb44",
  \ 'class': "\uf0e8",
  \ 'classes': "\uf0e8",
  \ 'augroup': "\ufb44",
  \ 'autocommand groups': "\ufb44",
  \ 'struct': "\uf318",
  \ 'union': "\ufacd",
  \ 'member': "\uf02b",
  \ 'target': "\uf893",
  \ 'property': "\ufab6",
  \ 'interface': "\uf7fe",
  \ 'namespace': "\uf475",
  \ 'subroutine': "\uf9af",
  \ 'implementation': "\uf776",
  \ 'typeParameter': "\uf278",
  \ 'command': "\uf120",
  \ 'commands': "\uf120",
  \ 'default': "\uf29c"
\ }
nnoremap <silent> <leader>tt :Vista!!<CR>
nnoremap <silent> <leader>tf :Vista finder<CR>
" }}}

" asynctasks ==================================================== {{{
" asyncrun 运行时设置 quickfix 打开的高度
let g:asyncrun_open = 8
" 设置用来标记项目根目录的文件夹
let g:asyncrun_rootmarks = [ '.git', '.svn', '.root', '.project', '.hg' ]
" 在下方打开内部终端
let g:asynctasks_term_pos = 'bottom'
" 终端可复用
let g:asynctasks_term_reuse = 1
" 显示分屏内置终端时不切换焦点
let g:asynctasks_term_focus = 0
" 将内置终端的 buffer 设置为 bufhidden
let g:asynctasks_term_hideen = 1
let g:asynctasks_term_listed = 0
nnoremap <silent><leader>tb :AsyncTask file-build<CR>
nnoremap <silent><leader>tr :AsyncTask file-run<CR>
nnoremap <silent><leader>tl :AsyncTaskList<CR>
nnoremap <silent><leader>te :AsyncTaskEdit<CR>
" }}}

" FZF =========================================================== {{{
let g:fzf_history_dir = '~/.local/share/fzf-history'
" float 模式
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
let g:fzf_layout = { 'down': '50%' }
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=* Ag
  \ call fzf#vim#ag(
  \   <q-args>,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%', '?'),
  \   <bang>0)
" Hide statusline
augroup fzf
  autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup end
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
nnoremap <silent> <leader> :<C-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>WhichKeyVisual '<Space>'<CR>
" nnoremap <silent> <localleader> :<C-u>WhichKey ','<CR>
call which_key#register('<Space>', 'g:which_key_map')

nnoremap <silent> <leader>fP :call ShowFilePath()<CR>

let g:which_key_map = {}

let g:which_key_map['?'] = ['Maps', 'show-keybindings']
let g:which_key_map[';'] = ['<Plug>NERDCommenterToggle', 'commenter']
let g:which_key_map['q'] = ['q', 'quit']
let g:which_key_map['Q'] = [':qa!', 'quit all without saving']

let g:which_key_map.f = {
  \ 'name': '+find/files/fold',
  \ 's': ['update', 'save file'],
  \ 'S': ['wall', 'save all file'],
  \ 'p': ['Files', 'fzf'],
  \ 'e': [':CocCommand explorer', 'file folder'],
  \ 'P': 'show file path'
\ }
let g:which_key_map.t = {
  \ 'name': '+toggle/tag/task',
  \ 't': 'vista tagbar',
  \ 'f': 'vista tagbar finder',
  \ 'B': ['BTags', 'fzf buffer tag'],
  \ 'T': ['Tags', 'fzf global tag'],
  \ 'i': ['IndentLinesToggle', 'indentLine'],
  \ 'b': 'build task',
  \ 'r': 'run task',
  \ 'l': 'task list',
  \ 'e': 'edit task',
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
let g:which_key_map.e = {
  \ 'name': '+editor',
  \ 'p': [':set paste!', 'paste mode']
\ }

let g:which_key_map.g = {
  \ 'name': '+git',
  \ 'j': 'chunk next',
  \ 'k': 'chunk prev',
  \ 'i': 'chunk info',
  \ 'c': 'commits of current chunk',
  \ 'u': 'chunk undo',
  \ 'a': 'chunk stage',
  \ 's': 'status',
  \ 'd': 'diff staged',
  \ 'l': { 'name': '+logs', 'c': 'log(cur buf) fuzzy finder', 'a': 'log(all) fuzzy finder' },
\ }

let g:which_key_map.l = {
  \ 'name': '+lsp',
  \ "\<Space>": 'list',
  \ 'j': 'diagnostic next(ale)',
  \ 'k': 'diagnostic prev(ale)',
  \ 'i': 'diagnostic info(ale)',
  \ 'l': 'diagnostic list(ale)',
  \ 'c': 'command list',
  \ 'd': 'jump to definition',
  \ 'D': 'jump to declaration',
  \ 't': 'jump to type definition',
  \ 'r': 'jump to reference',
  \ 'm': 'jump to implementation',
  \ 'R': 'rename symbol',
  \ 'f': 'format',
  \ 'F': 'fix code',
  \ 'a': 'code action',
  \ 'A': 'codelens action',
  \ 'e': 'open refactor window',
  \ 'v': 'range select',
\ }

" }}}

" ale config =============================================== {{{
nnoremap <silent> <leader>lj :ALENextWrap<CR>
nnoremap <silent> <leader>lk :ALEPreviousWrap<CR>
nnoremap <silent> <leader>li :ALEDetail <CR>
let g:ale_linters = {
  \ 'go': [ 'gopls' ],
  \ 'java': [ 'eclipselsp', 'checkstyle', 'pmd' ],
\ }
let g:ale_java_eclipselsp_path = '/usr/local/share/eclipse/jdt-language-server'
let g:ale_java_eclipselsp_javaagent = '/usr/local/share/lombok/lombok.jar'
let g:ale_java_checkstyle_config = '$HOME/Documents/Java/java-code-quality/checkstyle/checkstyle.xml'
let g:ale_java_pmd_options = 'pmd -cache /tmp/pmd.cache -R $HOME/Documents/Java/java-code-quality/pmd/pmd-ruleset_6.0.xml'
" 定义错误/警告标识
let g:ale_sign_error = "\uf65b"
let g:ale_sign_warning = "\uf421"
" 文件保存时才进行检查
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" 定义代码检查信息输出格式
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_info_str = 'I'
let g:ale_echo_msg_format = '[%linter%%:code%] %s [%severity%]'
" virtual text
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 10
let g:ale_virtualtext_prefix = '▸'

" 显示 ale 错误列表 {{{
function! s:ale_list() abort
  let g:ale_open_list = 1
  call ale#Queue(0, 'lint_file')
endfunction
command! ALEList call s:ale_list()
nnoremap <silent> <leader>ll :ALEList<CR>
augroup ale
  autocmd FileType qf
    \ nnoremap <silent><buffer> q :let g:ale_open_list = 0<CR>:q!<CR>
augroup END
" }}}

" }}}

" vim-go ==================================================== {{{
let g:go_fmt_command = 'goimports'
" }}}

" gutentags ================================================= {{{
" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_exclude_filetypes = ['gitcommit', 'gitconfig', 'gitrebase', 'gitsendemail', 'git']
let g:gutentags_ctags_exclude = [
\  '*.git', '*.svn', '*.hg',
\  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
\  '*-lock.json',  '*.lock',
\  '*.min.*',
\  '*.bak',
\  '*.zip',
\  '*.pyc',
\  '*.class',
\  '*.sln',
\  '*.csproj', '*.csproj.user',
\  '*.tmp',
\  '*.cache',
\  '*.vscode',
\  '*.pdb',
\  '*.exe', '*.dll', '*.bin',
\  '*.mp3', '*.ogg', '*.flac',
\  '*.swp', '*.swo',
\  '.DS_Store', '*.plist',
\  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
\  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
\  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
\  '*.data', '*.tasks', '*.idea',
\]
" 配置 ctags 的参数
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 检测 ~/.cache/tags 不存在就新建
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif
" }}}

augroup javascriptFileType
  autocmd!
  autocmd BufNewFile,BufRead *.js set filetype=javascriptreact
augroup end

" vim: set fdl=0 fdm=marker:
