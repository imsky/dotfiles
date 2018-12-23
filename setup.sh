#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# todo: check that XCode is installed

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# NTFS support
brew cask install osxfuse && brew install ntfs-3g

# System tools
brew install bash-completion fzf htop nano ripgrep the_silver_searcher tmux tree w3m watch wget
/usr/local/opt/fzf/install
# todo: clean up the path modifications
echo 'export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"' >> ~/.bash_profile
# ensure brew-installed nano is used first
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bash_profile

# Media tools
brew install ffmpeg youtube-dl pdfgrep

# Dev tools
brew install geckodriver git git-extras git-fresh jq pgcli postgresql tig
# todo: consider replacing with asdf
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

# Ops tools
# todo: install kubectl and kops
brew install awscli docker-clean sops terraform-docs kubernetes-helm helmfile packer

defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# todo: customize profile
