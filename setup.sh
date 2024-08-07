#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

if [[ $(uname) = "Darwin" ]]; then
  # Check for XCode Command Line Tools
  gcc --version > /dev/null

  if [[ -z $(which brew) ]]; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  brew bundle install --verbose --file=macos/Brewfile

  if [[ -z $(grep 'setup complete' ~/.bash_profile | cat) ]]; then
    echo 'if [ -f ~/.bashrc ]; then source ~/.bashrc; fi' >> ~/.bash_profile
    echo 'export EDITOR=nano' >> ~/.bash_profile
    echo 'export PATH="/usr/local/bin:/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.bash_profile
    echo 'shopt -s histappend' >> ~/.bash_profile
    echo 'export HISTSIZE=9999' >> ~/.bash_profile
    echo 'export HISTFILESIZE=9999' >> ~/.bash_profile
    echo 'export HISTCONTROL=ignoreboth' >> ~/.bash_profile
    echo 'export HISTIGNORE=ls:bg:fg:history' >> ~/.bash_profile
    echo 'export HISTTIMEFORMAT="%F %T "' >> ~/.bash_profile
    echo 'export PROMPT_COMMAND="history -a"' >> ~/.bash_profile
    echo 'export AWS_SDK_LOAD_CONFIG=1' >> ~/.bash_profile
    /usr/local/opt/fzf/install

    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    cp -i .gitconfig .nanorc ~/
    echo '# setup complete\n\nRemember to customize .gitconfig' >> ~/.bash_profile
  fi
fi
