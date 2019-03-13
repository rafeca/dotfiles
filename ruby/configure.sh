#!/bin/bash

# Check for RVM installation
if [ ! -s ~/.rvm/scripts/rvm ]
then
  echo "Installing RVM..."

  # Install keys
  curl -sSL https://rvm.io/mpapis.asc | gpg --import -
  curl -sSL https://rvm.io/pkuczynski.asc | gpg --import -

  # Install rvm
  curl -sSL https://get.rvm.io | bash -s stable --autolibs=enabled --ignore-dotfiles

  # rubygems config
  echo "gem: --no-ri --no-rdoc" >> ~/.gemrc

  # Add config to the ~/.zshrc file
  echo "source `pwd`/$(dirname $0)/ruby.zsh" >> ~/.zshrc

  # Configure default gems to all gemsets
  echo "bundler" > ~/.rvm/gemsets/default.gems

  # Reload the shell
  source ~/.zshrc
fi

# Install last patchlevel of Ruby 2.3
rvm install ruby-2.3
rvm use --default ruby-2.3

# Install "global" gems
gem install terminal-notifier
