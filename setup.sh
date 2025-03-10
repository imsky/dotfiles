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
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    (echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> ~/.bash_profile
    eval "$(/usr/local/bin/brew shellenv)"
    # really can just do: git config --global --add safe.directory '*'
    git config --global --add safe.directory /usr/local/Homebrew
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
    echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> ~/.bash_profile
    # direnv hook MUST be last item to modify PROMPT_COMMAND
    echo 'eval "$(direnv hook bash)"' >> ~/.bash_profile
    eval "$(fzf --bash)"

    defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
    cp -i .gitconfig .nanorc ~/

    echo '# setup complete' >> ~/.bash_profile
  fi
fi
