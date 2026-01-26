### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## 指定 zsh cache 目录
export ZSH_CACHE_DIR=$HOME/.local/share/zinit
## Go
export GO111MODULE=on
export GOPROXY=https://proxy.golang.com.cn,direct

# sdkman 默认为离线模式，加快 shell 第一次启动速度，避免发起网络请求
export SDKMAN_OFFLINE_MODE=true

## Pipenv 配置
# export PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple
export PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple/
export PIPENV_VENV_IN_PROJECT=true
export PIPENV_IGNORE_VIRTUALENVS=1

export EDITOR=nvim
export SUDO_EDITOR=nvim
## You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SSH_KEY_PATH=/Users/richard/.ssh/id_ed25519
## Git LFS
export GIT_LFS_SKIP_SMUDGE=1
## 让 git diff 分页显示并且退出后不将
## 差异信息显示到屏幕上
export LESS=-R
# GPG 密钥密码弹框提示
export GPG_TTY=$(tty)
export LDFLAGS="-L/usr/local/opt/llvm/lib -L/usr/local/opt/zlib/lib -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include -I/usr/local/opt/zlib/include -I/opt/homebrew/opt/llvm/include -I/opt/homebrew/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig"

# 处理白色主题背景时 fd 搜索时相关结果文件路径不是太清晰的问题
# di=1;36  -> 1代表粗体，36代表青色 (Cyan)
export LS_COLORS="$LS_COLORS:di=1;36:"

export PATH=$HOME/go/bin:/usr/local/opt/llvm/bin:/opt/homebrew/opt/llvm/bin:/opt/homebrew/opt/libpq/bin:$HOME/opt/bin:$PATH


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

# FZF {{{
## export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always {} | head -500"'
# export FZF_DEFAULT_OPTS='--height 95% --preview-window "right:60%" --preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (bat --style=numbers,changes,header --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export BAT_STYLE='numbers,changes,header'
export FZF_DEFAULT_OPTS='--height 95% --preview-window "right:60%" --preview "~/.local/dotfiles/fzf/preview.sh {}"'
export FZF_DEFAULT_COMMAND='fd --type f'
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
# export FZF_COMPLETION_TRIGGER='\'
## export FZF_PREVIEW_COMMAND="bat --style=numbers,header --wrap never --color always {} || cat {} || tree -C {}"
# export FZF_PREVIEW_COMMAND='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || bat --style=numbers,changes --color=always {}'
## export FZF_CTRL_T_OPTS="--min-height 30 --preview-window down:60% --preview-window noborder --preview '($FZF_PREVIEW_COMMAND) 2> /dev/null'"
# }}}

alias ssh='TERM=xterm-256color ssh'
alias vssh='TERM=xterm-256color vagrant ssh'

# TERM config {{{
# if [ "$TMUX" = "" ]; then
#     export TERM="xterm-256color-italic";
#     alias ssh='TERM=xterm-256color ssh'
#     alias vssh='TERM=xterm-256color vagrant ssh'
# else
#     alias ssh='TERM=screen-256color ssh'
#     alias vssh='TERM=screen-256color vagrant ssh'
# fi
# }}}

alias ls='ls --color=auto'
alias nvi=nvim
alias vi=vim

## eza alias {{{
alias xs=eza
alias xl='xs -l'
alias xa='xl -a'
alias ll='xs -l'
alias la='xs -la'
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
alias gfw='cd "/Users/richard/Library/Mobile Documents/com~apple~CloudDocs/sing-box"'
# 这里我们直接用 sudo -e 替代 sudoedit
alias sn='sudo -e'
# }}}
# auth: 解锁 SSH key，有效期 1 天 (1d) 或 12 小时 (12h)
alias ssh-auth="ssh-add -t 1d ~/.ssh/id_ed25519"

# Proxy {{{
function proxy() {
    if [ -z "$1" ]; then
        echo "请提供一个 IP 地址作为参数。"
        echo "用法: proxy <IP_ADDRESS>"
        return 1
    fi
    local ip="$1"
    export {HTTP,HTTPS,FTP}_PROXY="http://$ip:3590"
    export ALL_PROXY="socks5://$ip:3589"
    echo "代理已启用，使用 IP: $ip"
}
function unproxy() {
    unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
    echo '代理已停用...'
}
# }}}
# History {{{
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=80000
SAVEHIST=60000
# }}}

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
  zdharma-continuum/zinit-annex-as-monitor \
  zdharma-continuum/zinit-annex-bin-gem-node \
  zdharma-continuum/zinit-annex-patch-dl \
  zdharma-continuum/zinit-annex-rust


zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit wait="0" lucid for \
  OMZ::lib/completion.zsh \
  OMZ::lib/git.zsh \
  OMZ::lib/key-bindings.zsh \
  OMZ::lib/history.zsh \
  OMZ::plugins/git/git.plugin.zsh

zinit wait="1" lucid for \
    zdharma-continuum/history-search-multi-word \
    OMZ::plugins/rust/rust.plugin.zsh \
  atload='eval "$(lua ${ZINIT[PLUGINS_DIR]}/skywind3000---z.lua/z.lua --init zsh enhanced once fzf)"' \
    skywind3000/z.lua

# 补全
zinit wait="1" lucid as="completion" for \
  OMZ::plugins/vagrant/_vagrant \
  gradle/gradle-completion \
  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker \
  OMZ::plugins/docker-compose/_docker-compose \
  OMZ::plugins/rust/_rustc

# Bun: 稍微晚一点加载，避免和 SDKMAN 撞车
zinit ice wait"0" lucid as"program" pick"$HOME/.bun/bin/bun" id-as'bun' run-atpull \
  atclone"curl -fsSL https://bun.com/install | bash" \
  atpull"$HOME/.bun/bin/bun upgrade" \
  atinit"export BUN_INSTALL=$HOME/.bun; path=($BUN_INSTALL/bin $path)" \
  atload"source <($HOME/.bun/bin/bun completions)"
zinit light zdharma-continuum/null

# NVM: 安排在第 2 秒加载，避开 SDKMAN 和 Bun
# 修改点：
# 1. wait"2" -> 错峰
# 2. 去掉了 pick 和 as"program" -> 避免作为子进程运行
# 3. 将 source 动作放在 atload 中 -> 确保加载时才生效
zinit ice wait"1" lucid id-as"nvm" run-atpull \
  atclone"mkdir -p $HOME/.nvm && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | NVM_DIR=$HOME/.nvm bash" \
  atpull"%atclone" \
  atinit"export NVM_DIR=$HOME/.nvm" \
  atload"source $HOME/.nvm/nvm.sh; [ -s \"$HOME/.nvm/bash_completion\" ] && source \"$HOME/.nvm/bash_completion\""
zinit light zdharma-continuum/null

# sdkman
# 注意：把 source init.sh 放在 atload 中，确保加载时才执行
zinit ice wait"2" lucid as"null" id-as"sdkman" run-atpull \
  atclone"curl -s https://get.sdkman.io | bash" \
  atpull"sdk selfupdate" \
  atinit"export SDKMAN_DIR=$HOME/.sdkman" \
  atload"source $HOME/.sdkman/bin/sdkman-init.sh" \
  pick"/dev/null"
zinit light zdharma-continuum/null

# zinit ice wait"1" lucid as'command' pick'bin/pyenv' atinit'export PYENV_ROOT="$PWD"' \
#     atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atpull"%atclone" src"zpyenv.zsh" nocompile'!' for \
#         pyenv/pyenv
# zinit light zdharma-continuum/null

# zinit ice wait"1" lucid atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
#     as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
# zinit light pyenv/pyenv

# Powerlevel10k 主题
zinit ice depth=1
zinit light romkatv/powerlevel10k

### End of Zinit's installer chunk

# vim: set fdl=0 fdm=marker:


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
# export SDKMAN_DIR="$HOME/.sdkman"
# [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
