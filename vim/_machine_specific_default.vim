" ========== 请根据自己本机环境重新配置相关变量参数 ==============
" Neovim special config {{{
"" python support
if g:editor == 'neovim'
  let g:python3_host_prog='/usr/local/bin/python3'
endif
" }}}
" FZF 执行文件路径指定
set rtp+=/usr/local/opt/fzf


" vim: set fdl=0 fdm=marker:
