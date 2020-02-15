" 获取当前文件所在目录
let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h')

let is_neovim = 0
let is_vim = 0
if has('nvim')
  let is_neovim = 1
else
  let is_vim = 1
endif

"" let plugins_config_path = s:home.'/plugins'
"" let plugins_config_file_list = split(globpath(plugins_config_path, '*.vim'), '\n')
" 定义加载文件命令
command! -nargs=1 LoadScript exec 'source '.s:home.'/'.'<args>'

" 加载基础配置
LoadScript base.vim

" 加载本地机器特殊配置 {{{
let has_machine_specific_file = 1
if empty(glob(s:home.'/_machine_specific.vim'))
  let has_machine_specific_file = 0
  silent! exec '!cp '.s:home.'/_machine_specific_default.vim '.s:home.'/_machine_specific.vim'
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
"" LoadScript theme.vim

"" for plugins_config_file in plugins_config_file_list
""   exec 'source' fnameescape(plugins_config_file)
"" endfor

" 第一次创建本地机器特殊配置需要先检查编辑
if has_machine_specific_file == 0
  exec ':silent e '.s:home.'/_machine_specific.vim'
endif

" vim: set fdl=0 fdm=marker:
