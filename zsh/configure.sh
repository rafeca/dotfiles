#!/bin/bash

# Make ZSH as the default shell for the current user
sudo chsh -s /bin/zsh "`whoami`"

# Load all the zsh files in the ~/.zshrc
echo "# dotfiles zsh config" >> ~/.zshrc
echo "source `pwd`/$(dirname $0)/main.zsh" >> ~/.zshrc

# Create basic folders
mkdir -p ~/bin
mkdir -p ~/tmp

mkdir -p ~/Documents/bin
mkdir -p ~/Documents/work/opensource
mkdir -p ~/Documents/buro
mkdir -p ~/Documents/random
