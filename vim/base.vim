" 记住退出位置
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Vim special config {{{
if is_vim == 1
  set nocompatible
  syntax on
  " 高亮显示匹配结果
  set hlsearch
  " 实时显示匹配结果
  set incsearch
  " 显示输入的命令
  set showcmd
  " command 模式下使用 Tab 键时显示候选命令列表
  set wildmenu
  if $TMUX != ''
    " 处理在 Tmux 中 TREM=screen-256color 时启用 true color 显示异常
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
endif
" }}}

" Neovim special config {{{
if is_neovim == 1
  if has('python')
    set pyx=2
  elseif has('python3')
    set pyx=3
  endif
endif
" }}}

" 设置字体及大小
set guifont=JetbrainsMono\ Nerd\ Font\ +\ :h11
" 设置行号
set number
" 设置相对行号
set relativenumber
" 高亮显示当前行
set cursorline
set cmdheight=2
set laststatus=2
" 设置分屏线
set fillchars+=vert:\|
" 设置真彩显示
set termguicolors
set lazyredraw
" 设置colorcolumn来显示一条或多条垂直竖线(标尺)
set cc=100
" 向上或向下滚动时距离窗口顶部或底部 5 行的距离
set scrolloff=5
" 搜索智能区分大小写
set ignorecase smartcase

set shortmess+=c
" 总是显示行号最左侧的符号标记列，默认为：自动
" 这样会造成代码语法错误时标识提示信息时屏幕经常抖动
set signcolumn=yes
set updatetime=500

" 制表符(设置所有的tab和缩进为4个空格) {
"" 设置tab键的宽度
set tabstop=4
"" 换行时行间交错使用4个空格
set shiftwidth=4
"" 自动缩进4空格
set cindent shiftwidth=4
set softtabstop=4
"" 使用空格来替换tab
set expandtab
"" 开启新行时使用智能 tab 缩进
set smarttab
" }

" 设置自动缩进
set autoindent
" 设置智能缩进
set smartindent
" 设置显示制表符和行尾空格符号，末尾回车换行符设置 eol:$
set listchars=tab:»\ ,trail:·
" 显示制表符（Tab）、行尾空格、回车换行符
set list


" code folding {{{
set nofoldenable
"fold based on indent
set foldmethod=indent
"deepest fold is 3 levels
set foldnestmax=3
" default folding level
set foldlevel=1
" }}}


let mapleader=' '

" vim: set fdl=0 fdm=marker:
