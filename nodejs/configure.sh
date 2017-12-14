#!/bin/bash

# Check for NVM installation
if [ ! -s ~/.nvm/nvm.sh ]
then
  echo "Installing NVM..."

  # Install nvm:
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

  # Configure nvm in the ~/.zshrc file:
  echo "source `pwd`/$(dirname $0)/nodejs.zsh" >> ~/.zshrc

  echo "[[ -s \$HOME/.nvm/nvm.sh ]] && . \$HOME/.nvm/nvm.sh # This loads NVM" >> ~/.zprofile
fi

# Install latest nodejs v8 version
. ~/.nvm/nvm.sh
nvm install 8
nvm alias default 8

# Install some global modules
npm install -g node-static prettyjson grunt-cli gulp eslint yarn

if [ "Not authed.  Run 'npm adduser'" = "$(npm whoami)" ]
then
  # Login into npm (for publishing)
  npm login
fi

# Add jshint default config
ln -s "`pwd`/$(dirname $0)/eslintrc.symlink" ~/.eslintrc
