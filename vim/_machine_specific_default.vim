scriptencoding utf-8
" ========== 请根据自己本机环境重新配置相关变量参数 ==============
" let g:vimColorScheme = 'Forest Night'

" let g:vimColorScheme = 'Edge Dark'
" let g:vimColorScheme = 'Edge Dark Aura'
" let g:vimColorScheme = 'Edge Dark Neon'
" let g:vimColorScheme = 'Edge Light'

let g:vimColorScheme = 'Gruvbox Material Dark'
" let g:vimColorScheme = 'Gruvbox Material Dark Soft'
" let g:vimColorScheme = 'Gruvbox Material Dark Hard'
" let g:vimColorScheme = 'Gruvbox Material Light'
" let g:vimColorScheme = 'Gruvbox Material Light Soft'
" let g:vimColorScheme = 'Gruvbox Material Light Hard'

" let g:vimColorScheme = 'Sonokai Shusia'
" let g:vimColorScheme = 'Sonokai Andromeda'
" let g:vimColorScheme = 'Sonokai Atlantis'
" let g:vimColorScheme = 'Sonokai Maia'

" Neovim special config {{{
" python support
if g:editor ==# 'neovim'
  let g:python_host_skip_check=1
  let g:python3_host_skip_check=1
  " let g:python3_host_prog='/usr/local/bin/python3'
  let g:python3_host_prog=exepath('python3')
  set pyx=3
  let g:loaded_ruby_provider=0
endif
" }}}

" FZF 执行文件路径指定
set runtimepath+=/usr/local/opt/fzf
" vim-beancount 配置
let b:beancount_root = '/Users/richard/OneDrive/Note/beancount/main.bean'


" vim: set fdl=0 fdm=marker:
