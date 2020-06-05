#!/bin/bash

# Check for NVM installation
if [ ! -s ~/.nvm/nvm.sh ]
then
  echo "Installing NVM..."

  # Install nvm:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

  # Configure nvm in the ~/.zshrc file:
  echo "source `pwd`/$(dirname $0)/nodejs.zsh" >> ~/.zshrc

  echo "[[ -s \$HOME/.nvm/nvm.sh ]] && . \$HOME/.nvm/nvm.sh # This loads NVM" >> ~/.zprofile
fi

# Install latest nodejs v8 version
. ~/.nvm/nvm.sh
nvm install 12
nvm alias default 12

# Install yarn
brew install yarn

# Install some global modules
yarn global add node-static prettyjson eslint

# Login to npm if we're not logged in yet.
npm whoami >> /dev/null 2>&1
exit_status=$?
if [ $exit_status -eq 1 ]; then
  # Login into npm (for publishing)
  npm login
fi

# Add eslint default config
ln -s "`pwd`/$(dirname $0)/eslintrc.symlink" ~/.eslintrc
