set nocompatible
" 设置语法高亮
syntax on

" 设置英文语言环境
let $LANG='en'
" 设置字体及大小
set guifont=RobotoMonoNerdFontComplete-Regular:h11
" 设置内部编码为utf-8
set encoding=utf-8
" 设置菜单为英文
set langmenu=en
" 关闭菜单栏
set guioptions-=m
" 关闭工具栏
set guioptions-=T
" 设置行号
set number
" 设置相对行号
set relativenumber
" 设置打开文件时使用的编码顺序
set fileencodings=utf-8,cp936,chinese,latin-1
" 设置Console输出编码
language messages en_US.utf-8
" 高亮显示当前行
set cursorline
" 使Backspace键能正常处理indent, eol, start等操作
set backspace=2
" 在 Vim 把所有以 0 开头的数字当成十进制处理，而不是默认的八进制
set nrformats=
" 总是显示当前位置
set ruler
" 搜索智能区分大小写
set ignorecase smartcase
" 高亮显示匹配结果
set hlsearch
" 实时显示匹配结果
set incsearch
" 设置命令行高度为2
set cmdheight=2
" 显示输入的命令
set showcmd
" command 模式下使用 Tab 键时显示候选命令列表
set wildmenu
" 设置colorcolumn来显示一条或多条垂直竖线(标尺)
set cc=80,100

" 制表符(设置所有的tab和缩进为4个空格) {
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
" }

" 设置自动缩进
set autoindent
" 设置智能缩进
set smartindent
" 设置显示制表符和行尾空格符号，末尾回车换行符设置 eol:$
set listchars=tab:»\ ,trail:·
" 显示制表符（Tab）、行尾空格、回车换行符
set list

" 保存 undo 历史 {
set undodir=~/.vim/undo_history
set undofile
" }

" code folding {
set foldenable
"fold based on indent
set foldmethod=indent
"deepest fold is 10 levels
set foldnestmax=10
" default folding level
set foldlevel=2
" }



"修改leader(默认为\)键为逗号
let mapleader=','
"取消/开启高亮显示匹配结果(normal 模式下',-空格')
nnoremap <leader><space> :set hls!<CR>
"取消/开启自动折行
nnoremap <leader>wr :set wrap!<CR>
"新建标签页
nnoremap <leader>tn :tabnew<CR>
" 设置行号和相对行号(normal 模式)
nnoremap <leader>nu :set nu! <bar> :set relativenumber!<CR>
" 设置相对行号
nnoremap <leader>rnu :set relativenumber!<CR>
" 解决粘贴内容到 Vim 终端缩进错乱（normal 模式：,pa）
nnoremap <leader>pa :set paste!<CR>
" 转换将 Tab 转换为空格
nnoremap <leader>ct :%retab<CR>
" 重新加载 vimrc 文件
nnoremap <leader>R :source $MYVIMRC<CR>
" normal 模式下保存文件内容
nnoremap <leader>w :w<CR>
" insert 模式下保存文件内容
inoremap <leader>w <Esc>:w<CR>
" 文件退出 {
nnoremap <leader>q :q<CR>
nnoremap <leader>qa :qa<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>QA :qa!<CR>
" }

" 显示或隐藏垂直标尺 {
nnoremap <leader>cc :set cc=80,100<CR>
nnoremap <leader>ccx :set cc=0<CR>
" }
" 分屏 {
nnoremap <leader>vl :set nosplitright<CR>:vsplit<CR>
"" 垂直分屏并且光标移动到右边
nnoremap <leader>vr :set splitright<CR>:vsplit<CR>
nnoremap <leader>su :set nosplitbelow<CR>:split<CR>
"" 水平分屏并且光标移动到下边
nnoremap <leader>sb :set splitbelow<CR>:split<CR>
nnoremap <up> :res +5<CR>
nnoremap <down> :res -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
" }

" Window 切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 行间快速移动
nnoremap J 5j
nnoremap K 5k

" Jenkinsfile syntax highlighting
au BufRead,BufNewFile Jenkinsfile setf groovy

" autocmd VimEnter,VimLeave * silent !tmux set status {
if $TMUX != ''
    set ttimeoutlen=20
elseif &ttimeoutlen > 60 || &ttimeoutlen <= 0
    set ttimeoutlen=60
endif
" }

source ~/.local/dotfiles/vim/plugins.vim
