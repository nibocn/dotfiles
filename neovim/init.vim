" 设置字体及大小
set guifont=RobotoMono\ Nerd\ Font\ +\ :h11
" 设置行号
set number
" 设置相对行号
set relativenumber
" 高亮显示当前行
set cursorline
set cmdheight=2
" 设置分屏线
set fillchars+=vert:\|
" 设置真彩显示
set termguicolors
" 设置colorcolumn来显示一条或多条垂直竖线(标尺)
set cc=100
" 向上或向下滚动时距离窗口顶部或底部 5 行的距离
set scrolloff=5
" 搜索智能区分大小写
set ignorecase smartcase

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


"消除高亮显示匹配结果
nnoremap <C-n> :nohl<CR>
" Window 切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <up> :resize +5<CR>
nnoremap <down> :resize -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>

" 行间快速移动
nnoremap J 5j
nnoremap K 5k
" 移动到文件最后一次编辑的位置
" 类似命令 gi 移动到文件最后一次编辑位置并进入 insert 模式
nnoremap gn `^

" 设置行号和相对行号
nnoremap <leader>nu :set nu! <bar> :set relativenumber!<CR>
" 解决粘贴内容到 Vim 终端缩进错乱
nnoremap <leader>pa :set paste!<CR>

" python support
let g:python3_host_prog='~/.Envs/neovim/.venv/bin/python'

if has('python')
  set pyx=2
elseif has('python3')
  set pyx=3
endif

" Jenkinsfile syntax highlighting
au BufRead,BufNewFile Jenkinsfile setf groovy
" Pipfile, Pipfile.lock syntax highlighting {{{
au BufRead,BufNewFile Pipfile setf dosini
au BufRead,BufNewFile Pipfile.lock setf json
" }}}

source ~/.local/dotfiles/neovim/plugins.vim
source ~/.local/dotfiles/neovim/functions.vim
