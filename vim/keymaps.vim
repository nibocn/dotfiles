scriptencoding utf-8
" *********************** 自定义快捷键 *****************************
" Base {{{
" 消除高亮显示匹配结果
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
" 移动到文件最后一次编辑的位置
" 类似命令 gi 移动到文件最后一次编辑位置并进入 insert 模式
nnoremap gn `^
" 设置行号和相对行号
" nnoremap <leader>nu :set nu! <bar> :set relativenumber!<CR>
" Buffer 切换
nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>

" 设置文件保存快捷键
inoremap <silent> <C-\>w <ESC>:w<CR>a
nnoremap <silent> <C-\>w :w<CR>
nnoremap <silent> <C-\>q :q<CR>
nnoremap <silent> <C-\>wq :wq<CR>
" }}}

nnoremap Y y$

" Keeping it centered
" nnoremap n nzzzv
" nnoremap N Nzzzv
nnoremap J mzJ`z

" Undo break points
inoremap ,  ,<C-g>u
inoremap .  .<C-g>u
inoremap !  !<C-g>u
inoremap ?  ?<C-g>u
inoremap :  :<C-g>u
inoremap ;  ;<C-g>u

" 出现自动换行时可按实际换行进行移动
" nnoremap <expr> j v:count ? 'j' : 'gj'
" nnoremap <expr> k v:count ? 'k' : 'gk'
" 将大于 5 行的移动保存到跳转列表中，使用 Ctrl-o/Ctrl-i 可切换跳转
" nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
" nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" 将大于 5 行的移动保存到跳转列表中，使用 Ctrl-o/Ctrl-i 可切换跳转
" 并且出现自动换行时可按实际换行进行移动
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

nnoremap <expr> 0 col('.') == 1 ? '^' : '0'

" Moving text
vnoremap <leader>k :m '<-2<CR>gv=gv
vnoremap <leader>j :m '>+1<CR>gv=gv
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

inoremap <C-l> <C-x><C-o>

" vim: set fdl=0 fdm=marker:
