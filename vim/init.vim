" 获取当前文件所在目录
let g:home_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" 定义使用的编辑器 {{{
if has('nvim')
  let g:editor = 'neovim'
else
  let g:editor = 'vim'
endif
" }}}

" 定义使用的操作系统 {{{
if !exists('g:system_os')
  if has('win64') || has('win32')
    let g:system_os = 'Windows'
  else
    let g:system_os = substitute(system('uname'), '\n', '', '')
  endif
endif
" }}}

" let plugins_config_path = g:home_path.'/plugins'
" let plugins_config_file_list = split(globpath(plugins_config_path, '*.vim'), '\n')
" 定义加载文件命令
command! -nargs=1 LoadScript exec 'source '.g:home_path.'/'.'<args>'

" 加载基础配置
LoadScript base.vim

" 加载本地机器特殊配置 {{{
let has_machine_specific_file = 1
if empty(glob(g:home_path.'/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec '!cp '.g:home_path.'/_machine_specific_default.vim '.g:home_path.'/_machine_specific.vim'
endif
LoadScript _machine_specific.vim
" }}}

" 加载快捷键映射
LoadScript keymaps.vim

" 加载插件
LoadScript plugins.vim

" 加载函数
LoadScript functions.vim

" 加载主题
" LoadScript theme.vim

" for plugins_config_file in plugins_config_file_list
"   exec 'source' fnameescape(plugins_config_file)
" endfor

" 第一次创建本地机器特殊配置需要先检查编辑
if has_machine_specific_file == 0
  exec ':silent e '.g:home_path.'/_machine_specific.vim'
endif

" vim: set fdl=0 fdm=marker:
