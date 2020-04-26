" 记住退出位置
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Vim special config {{{
if g:editor == 'vim'
  set nocompatible
  syntax on
  " 高亮显示匹配结果
  set hlsearch
  " 实时显示匹配结果
  set incsearch
  " 显示输入的命令
  set showcmd
  set ttimeout
  " 处理 <esc> 键按下的延迟时间
  set ttimeoutlen=50
  " command 模式下使用 Tab 键时显示候选命令列表
  set wildmenu
  " 将 vim 中的所有数字都当成十进制，默认以 0 开头的数字为八进制
  set nrformats=
  if $TERM == 'tmux-256color'
    " 处理在 Tmux 中启用 true color
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
  if g:system_os == 'Darwin'
    " 设置 vim 下不同模式切换时光标的样式
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    if !empty($TMUX)
      " 设置 tmux&vim 下不同模式切换时光标的样式
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
      let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    endif
  elseif g:system_os == 'Linux'
    let &t_SI = "\<Esc>[6 q"
    let &t_SR = "\<Esc>[4 q"
    let &t_EI = "\<Esc>[2 q"
    if !empty($TMUX)
      let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
      let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
      let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    endif
  endif
endif
" }}}

" Neovim special config {{{
if g:editor == 'neovim'
  " 设置 neovim 在不同模式下切换时光标的样式
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
endif
" }}}

" 设置字体及大小
set guifont=JetbrainsMono\ Nerd\ Font\ +\ :h12
set encoding=utf-8
set fileencodings=utf-8,cp936,chinese,latin-1
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
" 使滚动条移动得更快 {{{
set lazyredraw
set ttyfast
" }}}
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

" 按键响应等待超时时间
set timeoutlen=350

" 制表符(设置所有的tab和缩进为4个空格) {{{
" 设置tab键的宽度
set tabstop=4
" 换行时行间交错使用4个空格
set shiftwidth=4
" 自动缩进4空格
set cindent shiftwidth=4
set softtabstop=4
" 使用空格来替换tab
set expandtab
" 开启新行时使用智能 tab 缩进
set smarttab
" }}}

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
let maplocalleader=','

" vim: set fdl=0 fdm=marker:
