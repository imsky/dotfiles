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
    /usr/local/opt/fzf/install
    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    cp -i .gitconfig .nanorc ~/
    echo '# setup complete' >> ~/.bash_profile
  fi
fi
