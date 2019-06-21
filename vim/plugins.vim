" Automatic installation vim-plug {
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" }

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
" Markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'iamcco/mathjax-support-for-mkdp', {'for': 'markdown'}
Plug 'iamcco/markdown-preview.vim', {'for': 'markdown'}

" Plug 'gabrielelana/vim-markdown', {'for': 'markdown'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'aklt/plantuml-syntax', {'for': 'plantuml'}
Plug 'editorconfig/editorconfig-vim'
Plug 'simnalamburt/vim-mundo'
" 代码缩进线
Plug 'Yggdroot/indentLine'
" 代码片段插件
Plug 'SirVer/ultisnips'
" 显示目录树插件
Plug 'scrooloose/nerdtree'
" Vim 启动界面插件
Plug 'mhinz/vim-startify'
" 搜索
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" reStructuredText
Plug 'Rykka/riv.vim', {'for': 'rst'}

" 中文输入法自动切换
Plug 'ybian/smartim'
" 不同模式下光标形状自动切换
Plug 'sjl/vitality.vim'
" 自动插入成对文字（如：括号、引号）
Plug 'jiangmiao/auto-pairs'
" 对已有内容插入成对的符号
Plug 'tpope/vim-surround'
" Git 文件修改状态显示
Plug 'airblade/vim-gitgutter'
" Git plugin
Plug 'tpope/vim-fugitive'
" 光标移动有点卡暂时不使用了
" Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}
" 代码补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()



" 配置主题 {
set background=dark
colorscheme gruvbox
" }

" Markdown {
let g:vim_markdown_conceal = 0
nnoremap <leader>mtf :TableFormat<CR>
" }


" airline 配置
let g:airline_theme="gruvbox"
let g:airline_powerline_fonts=1

" PlantUML syntax
au BufRead,BufNewFile *.{uml,plantuml,pu,puml} set filetype=plantuml

" vim-mundo
nnoremap <leader>ud :MundoToggle<CR>

" indentLine {
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar = '·'
nnoremap <leader>it :IndentLinesToggle<CR>
" }

" NERDTree {
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
" 打开 vim 时如果没有文件自动打开 NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif
" 当 NERDTree 为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" }

" UltiSnips {
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" }

" riv {
nnoremap <leader>rb :Riv2HtmlFile<CR>
nnoremap <leader>rbb :Riv2HtmlAndBrowse<CR>
" }

" gitgutter {
set updatetime=300
" }

" XkbSwitch
" let g:XkbSwitchEnabled = 1

" coc config {
"" use <leader>/ for trigger completion
inoremap <silent><expr> <leader>/ coc#refresh()
" }
