source ~/.zinit/bin/zinit.zsh

# Export {{{
## export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='nvim'
## You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SSH_KEY_PATH=/Users/richard/.ssh/id_rsa
## Git LFS
export GIT_LFS_SKIP_SMUDGE=1
## Pipenv 配置
# export PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple
export PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple/
export PIPENV_VENV_IN_PROJECT=true
## Groovy 配置
export GROOVY_HOME='/usr/local/opt/groovy/libexec'
## Go
export GOPATH=$HOME/go
export GO111MODULE=on
export GOPROXY=https://goproxy.io
## zlib
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/mysql-client/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/mysql-client/include -I/usr/local/opt/openssl@1.1/include"
# Bat 配置
export BAT_CONFIG_PATH=$HOME/.local/dotfiles/bat.conf
# z.lua 配置
# 增强模式
export _ZL_MATCH_MODE=1

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/mysql-client/bin:/usr/local/opt/openssl@1.1/bin:$GOPATH/bin:$PATH

# }}}

# Powerlevel10k {{{
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable virtualenv nodeenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time background_jobs)
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
## 调整当前显示目录层级不显示完整路径，只显示当前目录
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
## 设置起始行提示字符
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{014}\u256D\u2500%f"
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{014}\u2570%F{cyan}\uF460%F{073}\uF460%F{109}\uF460%f "
## POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{blue}\u256D\u2500%f"
## POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{blue}\u2570\uf460%f "
# }}}

# TERM config {{{
if [ "$TMUX" = "" ]; then
    export TERM="xterm-256color-italic";
    alias ssh='TERM=xterm-256color ssh'
    alias vssh='TERM=xterm-256color vagrant ssh'
else
    alias ssh='TERM=screen-256color ssh'
    alias vssh='TERM=screen-256color vagrant ssh'
fi
# }}}

# Alias {{{
# alias vvim='\vim'
# alias vim=nvim
alias nvi=nvim
alias vi=vim
alias rg='ranger'
alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias fk=fuck
alias mkcd='foo(){ mkdir -p "$1"; cd "$1" }; foo'
alias note='cd ~/Documents/Note && nvi'
## alias mvim='mvim --remote-tab'
## exa alias {{{
alias xs=exa
alias xl='xs -l'
alias xa='xl -a'
alias xx='xl --sort=Extension' # Lists sorted by extension (GNU only).
alias xk='xl --sort=size -r' # Lists sorted by size, largest last.
alias xt='xl --sort=modified -r' # Lists sorted by date, most recent last.
alias xc='xt -m' # Lists sorted by date, most recent last, shows change time.
alias xu='xt -u' # Lists sorted by date, most recent last, shows access time.
alias xtree='xl --tree '
## }}}
alias -s md=nvim
alias -s txt=nvim
alias -s rst=nvim
alias -s zip='unzip -l'
alias -s rar='unrar l'
alias -s tar='tar tf'
alias -s tar.gz='echo '
alias -s jar='java -jar'
## Docker alias {{{
alias dpid="docker inspect --format '{{.State.Pid}}'"
alias dip="docker inspect --format '{{ .NetworkSettings.Networks.public.IPAddress }}'"
## }}}
## Tmux {{{
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'
## }}}
# }}}

# Proxy {{{
function proxy() {
    export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:6152"
    export ALL_PROXY="socks5://127.0.0.1:6153"
}
function unproxy() {
    unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
}
# }}}

# Other config {{{
## 不显示主机及账号相关上下文
# prompt_context () { }
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# }}}

# SDKMAN {{{
## THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/richard/.sdkman"
# [[ -s "/Users/richard/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/richard/.sdkman/bin/sdkman-init.sh"
# }}}

# FZF {{{
## export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500"'
export FZF_DEFAULT_OPTS='--height 90% --preview-window "right:60%" --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers,changes,header --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
## export FZF_PREVIEW_COMMAND="bat --style=numbers,header --wrap never --color always {} || cat {} || tree -C {}"
export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers,changes --color=always {}'
## export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
# }}}

# Zinit {{{
# 语法高亮
zinit ice lucid wait="0"
zinit light zdharma/fast-syntax-highlighting
# 自动建议
zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions
# 目录、文件颜色
zinit ice lucid wait="0" atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick='c.zsh'
zinit light trapd00r/LS_COLORS

# 快速路径切换
zinit ice lucid wait="0"
zinit light skywind3000/z.lua

zinit for \
  OMZ::lib/git.zsh \
  OMZ::lib/key-bindings.zsh

zinit ice lucid wait="0"
zinit snippet OMZ::plugins/fzf/fzf.plugin.zsh
# Git
zinit ice lucid wait="0"
zinit snippet OMZ::plugins/git/git.plugin.zsh
# 补全
# zinit ice lucid wait="1" as="completion"
# zinit snippet OMZ::plugins/docker/_docker
# zinit as="completion" for \
#     OMZ::plugins/docker/_docker \
#     OMZ::plugins/gradle/_gradle

zinit ice lucid wait="0" atload="zpcompinit; zpcdreplay"
zinit snippet OMZ::lib/completion.zsh

# 加载 pure 主题
# zinit ice lucid wait="0" pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure
zinit ice depth=1
zinit light romkatv/powerlevel10k
# }}}

# vim: set fdl=0 fdm=marker:
