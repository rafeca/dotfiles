#!/usr/bin/env bash

# Check for Homebrew installation
if test ! $(which brew)
then
  echo "Installing Homebrew..."

  # Install homebrew
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

fi

brew analytics off

# Update homebrew formaulaes
brew update

# Install some packages
brew install wget ssh-copy-id coreutils hub trash tmux reattach-to-user-namespace watch colordiff jq exiftool


# Install homebrew cask
brew tap caskroom/cask
brew tap caskroom/versions

# Install a newer version of html tidy (for SublimeLinter package)
brew install tidy-html5

# Install a new version of rsync
brew install homebrew/dupes/rsync
