" *********************** 自定义快捷键 *****************************
" Base {{{
"" 消除高亮显示匹配结果
nnoremap <C-n> :nohl<CR>
"" Window 切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <up> :resize +5<CR>
nnoremap <down> :resize -5<CR>
nnoremap <left> :vertical resize-5<CR>
nnoremap <right> :vertical resize+5<CR>
"" 行间快速移动
nnoremap J 5j
nnoremap K 5k
"" 移动到文件最后一次编辑的位置
"" 类似命令 gi 移动到文件最后一次编辑位置并进入 insert 模式
nnoremap gn `^
"" 设置行号和相对行号
nnoremap <leader>nu :set nu! <bar> :set relativenumber!<CR>
"" }}}

" vim: set fdl=0 fdm=marker:
