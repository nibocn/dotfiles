
" Build function {{{
nnoremap <C-a>b :call BuildRun()<CR>
inoremap <C-a>b <Esc>:call BuildRun()<CR>
function! BuildRun()
  exec "w"
  if &filetype == 'html'
    if has('mac')
      exec ":silent !open -a Google\\ Chrome '%'"
    endif
  elseif &filetype == 'markdown'
    " 依赖 markdown-preview.nvim 插件
    exec "MarkdownPreview"
  endif
endfunc
" }}}

" 将宏应用到所选择的行上 {{{
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}
