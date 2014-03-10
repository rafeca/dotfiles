#!/usr/bin/env bash

# Check for Homebrew installation
if test ! $(which brew)
then
  echo "Installing Homebrew..."

  # Install homebrew
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

fi

# Update homebrew formaulaes
brew update

# Install some packages
brew install wget ssh-copy-id coreutils hub trash tmux reattach-to-user-namespace

# Tell applications that use xcode-select where the GNU utils are located
sudo xcode-select --switch /usr/bin

# Install homebrew cask
brew tap phinze/homebrew-cask
brew tap caskroom/versions
brew install brew-cask

# Install a newer version of html tidy (for SublimeLinter package)
brew install homebrew/dupes/tidy
