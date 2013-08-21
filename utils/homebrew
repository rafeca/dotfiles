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
brew install wget ssh-copy-id