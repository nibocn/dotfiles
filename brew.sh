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

# zsh plugin
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting

brew install thefuck
brew install git
brew install tmux
brew install macvim

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
