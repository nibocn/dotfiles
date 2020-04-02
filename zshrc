# Export {{{
## export MANPATH="/usr/local/man:$MANPATH"
## Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

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

export PATH=/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-sed/libexec/gnubin:/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.6.0/bin:/usr/local/opt/gnu-tar/libexec/gnubin:/usr/local/opt/mysql-client/bin:/usr/local/opt/openssl@1.1/bin:$GOPATH/bin:$PATH

# }}}
# Bat 配置
export BAT_CONFIG_PATH=$HOME/.local/dotfiles/bat.conf

# ZSH default {{{
## Set name of the theme to load. Optionally, if you set this to "random"
## it'll load a random theme each time that oh-my-zsh is loaded.
## See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
## ZSH_THEME="robbyrussell"
## ZSH_THEME="agnoster"
## ZSH_THEME="powerlevel10k/powerlevel10k"

## Uncomment the following line to use case-sensitive completion.
## CASE_SENSITIVE="true"

## Uncomment the following line to use hyphen-insensitive completion. Case
## sensitive completion must be off. _ and - will be interchangeable.
## HYPHEN_INSENSITIVE="true"

## Uncomment the following line to disable bi-weekly auto-update checks.
## DISABLE_AUTO_UPDATE="true"

## Uncomment the following line to change how often to auto-update (in days).
## export UPDATE_ZSH_DAYS=13

## Uncomment the following line to disable colors in ls.
## DISABLE_LS_COLORS="true"

## Uncomment the following line to disable auto-setting terminal title.
## DISABLE_AUTO_TITLE="true"

## Uncomment the following line to enable command auto-correction.
## ENABLE_CORRECTION="true"

## Uncomment the following line to display red dots whilst waiting for completion.
## COMPLETION_WAITING_DOTS="true"

## Uncomment the following line if you want to disable marking untracked files
## under VCS as dirty. This makes repository status check for large repositories
## much, much faster.
## DISABLE_UNTRACKED_FILES_DIRTY="true"

## Uncomment the following line if you want to change the command execution time
## stamp shown in the history command output.
## The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
## HIST_STAMPS="mm/dd/yyyy"

## Would you like to use another custom folder than $ZSH/custom?
## ZSH_CUSTOM=/path/to/new-custom-folder

ZSH_CUSTOM=$HOME/.local/dotfiles/zsh/custom
source $ZSH/oh-my-zsh.sh
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

# Coreutils {{{
## 需要安装 coreutils 来替换默认的 ls 命令，注释掉一些适配性检查的代码提高打开新 Shell 的速度
## if brew list | grep coreutils > /dev/null ; then
##    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
## PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
## alias ls='ls -F --show-control-chars --color=auto'
## eval `gdircolors -b $HOME/.dir_colors`
## fi
eval $(gdircolors -b ~/.dircolors/ls_colors)
alias ls='gls --color=auto'
# }}}

# Other config {{{
## redefine prompt_context for hiding user@hostname
## 不显示主机及账号相关上下文
prompt_context () { }
## added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
## pyenv
eval "$(pyenv init -)"
## 增强命令搜索，支持正则，使用 fzf 代替
## bindkey '^R' history-incremental-pattern-search-backward
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}
# }}}

# SDKMAN {{{
## THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/richard/.sdkman"
[[ -s "/Users/richard/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/richard/.sdkman/bin/sdkman-init.sh"
# }}}

# zplug {{{
## install zplug, plugin manager for zsh, https://github.com/zplug/zplug
## curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
## zplug configruation
if [[ ! -d "${ZPLUG_HOME}" ]]; then
  if [[ ! -d ~/.zplug ]]; then
    git clone --depth=1 https://github.com/zplug/zplug ~/.zplug
    # If we can't get zplug, it'll be a very sobering shell experience. To at
    # least complete the sourcing of this file, we'll define an always-false
    # returning zplug function.
    if [[ $? != 0 ]]; then
      function zplug() {
        return 1
      }
    fi
  fi
  export ZPLUG_HOME=~/.zplug
fi
if [[ -d "${ZPLUG_HOME}" ]]; then
  source "${ZPLUG_HOME}/init.zsh"
fi

## Plugins list {{{
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug 'romkatv/powerlevel10k', as:theme
zplug 'plugins/common-aliases', from:oh-my-zsh
zplug 'plugins/osx', from:oh-my-zsh, if: "[[ $OSTYPE == *darwin* ]]"
zplug 'plugins/git', from:oh-my-zsh
zplug 'plugins/autojump', from:oh-my-zsh, if: 'which autojump'
zplug 'plugins/gradle', from:oh-my-zsh
zplug 'plugins/tmux', from:oh-my-zsh
zplug 'plugins/docker', from:oh-my-zsh
zplug 'plugins/docker-compose', from:oh-my-zsh
zplug 'plugins/vagrant', from:oh-my-zsh
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions', defer:2
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
## }}}

## Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
## Then, source plugins and add commands to $PATH
zplug load
# }}}

# autojump {{{
j() {
    if [[ "$#" -ne 0 ]]; then
        cd "$(autojump $@)"
        return
    fi
    cd "$(autojump -s | sort -k1gr | awk '$1 ~ /[0-9]:/ && $2 ~ /^\// { for (i=2; i<=NF; i++) { print $(i) } }' |  fzf --height 40% --reverse --inline-info)"
}
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

# vim: set fdl=0 fdm=marker:
