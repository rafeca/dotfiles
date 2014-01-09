#!/usr/bin/env bash

# Check for Homebrew installation
if test ! $(which brew)
then
  echo "Installing Homebrew..."

  # Install homebrew
  ruby -e "$(curl -fsSkL raw.github.com/mxcl/homebrew/go)"
fi

# Update homebrew formaulaes
brew update

# Install some packages
brew install wget ssh-copy-id coreutils hub trash tmux reattach-to-user-namespace

# Tell applications that use xcode-select where the GNU utils are located
sudo xcode-select --switch /usr/bin

# Install homebrew cask
brew tap phinze/homebrew-cask
brew install brew-cask

# Install quicklook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json && qlmanage -r

# Install vagrant
brew cask install vagrant
