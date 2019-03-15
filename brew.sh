#!/usr/bin/env bash

# Install command-line tools using Homebrew.

brew update

brew upgrade
brew cask upgrade

brew install coreutils

brew install zsh

# Python
brew install python@2
brew install python@3
brew install pyenv
brew install pipenv

brew install thefuck
brew install git
brew install tmux
brew install macvim
brew install tldr
brew install autojump
brew install you-get
brew install the_silver_searcher
brew install exa

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install
brew install highlight


brew cask install postman
brew cask install dbeaver-community
brew cask install mpv
brew cask install iina
brew cask install snipaste
brew cask install sublime-text
brew cask install visual-studio-code
brew cask install flux
brew cask install xmind-zen
brew cask install calibre
brew cask install pomotodo
# 修改键盘映射
brew cask install karabiner-elements
