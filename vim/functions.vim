scriptencoding utf-8
" 将宏应用到所选择的行上 {{{
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo '@'.getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction
" }}}

" 复制匹配的内容 {{{
function! CopyMatches(reg)
  let l:hits = []
  %s//\=len(add(l:hits, submatch(0))) ? submatch(0) : ''/gne
  let l:reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.l:reg.' = join(l:hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)
" }}}

" 检测函数（检测光标位置处文字的样式名） {{{
function! <SID>SynStack()
  echo map(synstack(line('.'),col('.')),'synIDattr(v:val, "name")')
endfunction
command! -register SynStack call <SID>SynStack()
" }}}

function ShowFilePath() abort
  let l:path = expand('%:f')
  " echo l:path
  execute 'redir @+ | echo "' . l:path . '" | redir end'
endfunction
command! -register ShowFilePath call ShowFilePath()

" vim: set fdl=0 fdm=marker:
