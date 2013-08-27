#!/usr/bin/env bash

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

  # Install nodejs v0.10.x
  nvm install 0.10
  nvm alias default 0.10
fi

# Install some global modules
npm install -g node-static prettyjson grunt-cli bower

if [ -z $(npm whoami) ]
then
  # Login into npm (for publishing)
  npm login
fi