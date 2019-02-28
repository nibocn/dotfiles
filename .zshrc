# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/local/opt/go/libexec/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
ZSH_CUSTOM=$HOME/.local/dotfiles/zsh/custom

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z common-aliases mvn gradle osx docker docker-compose vagrant thefuck tmux tmuxinator zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# User configuration

# redefine prompt_context for hiding user@hostname
prompt_context () { }

# export MANPATH="/usr/local/man:$MANPATH"

export EDITOR='vim'
# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export SSH_KEY_PATH=/Users/richard/.ssh/id_rsa
# Git LFS
export GIT_LFS_SKIP_SMUDGE=1
# Pipenv 配置
export PIPENV_PYPI_MIRROR=https://mirrors.aliyun.com/pypi/simple
export PIPENV_VENV_IN_PROJECT=true
# Groovy 配置
export GROOVY_HOME='/usr/local/opt/groovy/libexec'
export TERM="xterm-256color"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias ls='ls -GF'

#  自定义配置

alias grep='grep --color'
alias egrep='egrep --color'
alias fgrep='fgrep --color'
alias vi=vim
alias fk=fuck
# alias mvim='mvim --remote-tab'

alias -s md=vim
alias -s txt=vim
alias -s rst=vim
alias -s zip='unzip -l'
alias -s rar='unrar l'
alias -s tar='tar tf'
alias -s tar.gz='echo '
alias -s jar='java -jar'
# Docker alias {
alias dpid="docker inspect --format '{{.State.Pid}}'"
alias dip="docker inspect --format '{{ .NetworkSettings.Networks.public.IPAddress }}'"
# }

# 设置代理 {
function proxy() {
    export {HTTP,HTTPS,FTP}_PROXY="http://127.0.0.1:6152"
    export ALL_PROXY="socks5://127.0.0.1:6153"
}
function unproxy() {
    unset {HTTP,HTTPS,FTP}_PROXY
    unset ALL_PROXY
}
# }


# 需要安装 coreutils 来替换默认的 ls 命令，注释掉一些适配性检查的代码提高打开新 Shell 的速度 {
# if brew list | grep coreutils > /dev/null ; then
#    PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# alias ls='ls -F --show-control-chars --color=auto'
# eval `gdircolors -b $HOME/.dir_colors`
# fi
eval $(gdircolors -b ~/.dircolors/ls_colors)
alias ls='gls --color=auto'

# }

# autojump 配置 {
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
# }


# added by travis gem
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# pyenv
eval "$(pyenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/richard/.sdkman"
[[ -s "/Users/richard/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/richard/.sdkman/bin/sdkman-init.sh"

# 增强命令搜索，支持正则
bindkey '^R' history-incremental-pattern-search-backward

function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

source $HOME/.local/dotfiles/zsh/custom/plugins/zsh-syntax-highlighting-filetypes/zsh-syntax-highlighting-filetypes.zsh
