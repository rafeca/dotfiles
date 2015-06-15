#!/bin/bash

# Check for NVM installation
if [ ! -s ~/.nvm/nvm.sh ]
then
  echo "Installing NVM..."

  # Install nvm:
  curl https://raw.githubusercontent.com/creationix/nvm/v0.22.0/install.sh | bash

  # Configure nvm in the ~/.zshrc file:
  echo "source `pwd`/$(dirname $0)/nodejs.zsh" >> ~/.zshrc
fi

# Install latest nodejs v0.10 version
. ~/.nvm/nvm.sh
nvm install 0.12
nvm alias default 0.12

# Install some global modules
npm install -g node-static node-inspector prettyjson grunt-cli bower jshint

if [ "Not authed.  Run 'npm adduser'" = "$(npm whoami)" ]
then
  # Login into npm (for publishing)
  npm login
fi

# Add jshint default config
ln -s "`pwd`/$(dirname $0)/jshintrc.symlink" ~/.jshintrc
