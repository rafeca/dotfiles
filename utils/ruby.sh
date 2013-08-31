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

  # Reload the shell
  source ~/.zshrc
fi

# Install last patchlevel of Ruby 2.0.0
rvm install 2.0.0
rvm use --default 2.0.0

# Install "global" gems
gem install terminal-notifier
gem install vagrant