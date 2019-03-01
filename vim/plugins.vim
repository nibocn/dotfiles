
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
" 光标移动有点卡暂时不使用了
" Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}

call plug#end()

