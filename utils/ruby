#!/usr/bin/env bash

# Check for RVM installation
if [ ! -s ~/.rvm/scripts/rvm ]
then
  echo "Installing RVM..."

  # Install rvm
  curl -L https://get.rvm.io | bash -s stable --autolibs=enabled --ignore-dotfiles

  # rubygems config
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

  # Add config to the ~/.zshrc file
  echo "source `pwd`/$(dirname $0)/ruby.zsh" >> ~/.zshrc
fi

# Install some gems
sudo gem install terminal-notifier
sudo gem install vagrant