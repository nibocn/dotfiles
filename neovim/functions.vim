
" Build function {{{
nnoremap <C-S-b> :call BuildRun()<CR>
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
