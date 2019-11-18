#!/usr/bin/env bash

# Install command-line tools using Homebrew.

ask() {
  while true; do
    read -p "$1 ([y]/n) " -r
    REPLY=${REPLY:-"y"}
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      return 1
    elif [[ $REPLY =~ ^[Nn]$ ]]; then
      return 0
    fi
  done
}


brew update
echo ">> brew ready to upgarde packages:"
brew outdated
echo ">> brew cask ready to upgrade packages:"
brew cask outdated

ask "是否要升级已存在的软件包？"
if [ $? -eq 1 ]; then
  brew upgrade
  brew cask upgrade
fi


# brew package lists
brewPackages=("coreutils zsh python@2 python@3 pyenv pipenv thefuck git
               tmux macvim tldr autojump you-get the_silver_searcher
               exa highlight nodeenv nvm zlib yarn figlet toilet ranger lsd pandoc gnu-sed gnu-tar
               go")

for package in $brewPackages
do
  if brew ls --versions $package > /dev/null; then
    echo "$package existed"
  else
    brew install $package
  fi
done


if brew ls --versions fzf > /dev/null; then
  echo "fzf existed"
else
  brew install fzf
  $(brew --prefix)/opt/fzf/install
fi


# brew cask package lists
brewcaskPackages=("postman dbeaver-community mpv iina snipaste sublime-text
                   visual-studio-code flux xmind-zen calibre pomotodo
                   karabiner-elements gifrocket fliqlo virtualbox virtualbox-extension-pack
                   vagrant xquartz")

for package in $brewcaskPackages
do
  if brew cask ls --versions $package > /dev/null; then
    echo "$package existed"
  else
    brew cask install $package
  fi
done


ask "是否要清理已下载的软件安装包？"
if [ $? -eq 1 ]; then
  brew cleanup
fi
