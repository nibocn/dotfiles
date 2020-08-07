## Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

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
export PIPENV_IGNORE_VIRTUALENVS=1
## Groovy 配置
export GROOVY_HOME='/usr/local/opt/groovy/libexec'
## Go
export GOPATH=$HOME/go
export GO111MODULE=on
export GOPROXY=https://goproxy.io
## zlib
export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/mysql-client/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/zlib/include -I/usr/local/opt/mysql-client/include -I/usr/local/opt/openssl@1.1/include"
# Bat 配置
export BAT_CONFIG_PATH=$HOME/.local/dotfiles/bat.conf
# z.lua 配置
# 增强模式
export _ZL_MATCH_MODE=1
# 处理 git log || git diff 等命令不一次性全部显示在屏幕上
export PAGER=less
export LESS=-R
# sdkman 默认为离线模式，加快 shell 第一次启动速度，避免发起网络请求
export SDKMAN_OFFLINE_MODE=true

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/mysql-client/bin:/usr/local/opt/openssl@1.1/bin:$GOPATH/bin:/usr/local/opt/llvm/bin:$PATH

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
alias ls='ls --color=auto'
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
## cd {{{
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
#}}}
# }}}

# Proxy {{{
function proxy() {
    export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:6152"
    export ALL_PROXY="socks5://127.0.0.1:6153"
    echo '代理已启用...'
}
function unproxy() {
    unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
    echo '代理已停用...'
}
# }}}

# Other config {{{
## 不显示主机及账号相关上下文
# prompt_context () { }
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# }}}

# FZF {{{
## export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500"'
# export FZF_DEFAULT_OPTS='--height 95% --preview-window "right:60%" --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers,changes,header --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export BAT_STYLE='numbers,changes,header'
export FZF_DEFAULT_OPTS='--height 95% --preview-window "right:60%" --preview "~/.local/dotfiles/fzf/preview.sh {}"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
## export FZF_PREVIEW_COMMAND="bat --style=numbers,header --wrap never --color always {} || cat {} || tree -C {}"
# export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers,changes --color=always {}'
## export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
# }}}

# Zinit {{{
zinit wait="0" lucid for \
  zdharma/fast-syntax-highlighting \
  skywind3000/z.lua \
  atload='_zsh_autosuggest_start' \
  zsh-users/zsh-autosuggestions \
  atclone="dircolors -b LS_COLORS > c.zsh" atpull='%atclone' pick='c.zsh' \
  trapd00r/LS_COLORS

# sdkman
zinit ice wait="1" lucid
zinit light matthieusb/zsh-sdkman

zinit wait="0" lucid for \
  OMZ::lib/git.zsh \
  OMZ::lib/key-bindings.zsh \
  OMZ::plugins/fzf/fzf.plugin.zsh \
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/common-aliases/common-aliases.plugin.zsh

# 补全
zinit wait="1" lucid as="completion" for \
  OMZ::plugins/docker/_docker \
  OMZ::plugins/docker-compose/_docker-compose \
  OMZ::plugins/gradle/_gradle \
  OMZ::plugins/vagrant/_vagrant

zinit ice lucid wait="0" atload="zpcompinit; zpcdreplay"
zinit snippet OMZ::lib/completion.zsh

# 加载 pure 主题
# zinit ice pick"async.zsh" src"pure.zsh"
# zinit light sindresorhus/pure
zinit ice depth=1
zinit light romkatv/powerlevel10k
# }}}

# vim: set fdl=0 fdm=marker:
