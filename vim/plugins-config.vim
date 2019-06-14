" 配置主题 {
set background=dark
colorscheme gruvbox
" }

" Markdown
let g:vim_markdown_conceal = 0

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
" }

" NERDTree {
nmap <leader>nf :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeToggle<CR>
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
nmap <leader>rb :Riv2HtmlFile<CR>
nmap <leader>rbb :Riv2HtmlAndBrowse<CR>
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
