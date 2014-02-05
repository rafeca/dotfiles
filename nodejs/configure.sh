#!/bin/bash

# Check for NVM installation
if [ ! -s ~/.nvm/nvm.sh ]
then
  echo "Installing NVM..."

  # Install nvm:
  curl https://raw.github.com/creationix/nvm/master/install.sh | sh

  # Configure nvm in the ~/.zshrc file:
  echo "source `pwd`/$(dirname $0)/nodejs.zsh" >> ~/.zshrc

  # Reload the shell
  source ~/.zshrc
fi

# Install latest nodejs v0.10 version
nvm install 0.10
nvm alias default 0.10

# Install some global modules
npm install -g npm node-static node-inspector prettyjson grunt-cli bower jshint

if [ -z $(npm whoami) ]
then
  # Login into npm (for publishing)
  npm login
fi

# Add jshint default config
ln -s "`pwd`/$(dirname $0)/jshintrc.symlink" ~/.jshintrc
