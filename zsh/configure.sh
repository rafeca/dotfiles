#!/bin/bash

# Load all the zsh files in the ~/.zshrc
echo "# dotfiles zsh config" >> ~/.zshrc
echo "source `pwd`/$(dirname $0)/main.zsh" >> ~/.zshrc

# Create basic folders
mkdir -p ~/bin

mkdir -p ~/Documents/work/opensource
mkdir -p ~/Documents/buro
