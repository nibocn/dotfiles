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

" 复制匹配的内容 {{{
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
" }}}

" 检测函数（检测光标位置处文字的样式名） {{{
function! <SID>SynStack()
    echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunction
command! -register SynStack call <SID>SynStack()
" }}}

" vim: set fdl=0 fdm=marker:
