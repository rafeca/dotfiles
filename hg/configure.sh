#!/bin/bash

# Install latest version of Mercurial
brew install hg

# Get full name of the OSX user
default_hg_name="`finger $USER | head -n1 | cut -d ":" -f 3 | cut -c 2-`"

# Ask for credentials
read -p "Enter your Mercurial full name ($default_hg_name): " hg_name
read -p "Enter your Mercurial email: " hg_email

hg_name=${hg_name:-$default_hg_name}

echo "[ui]" >> ~/.hgrc.credentials
echo "username = $hg_name <$hg_email>" >> ~/.hgrc.credentials

ln -s "`pwd`/$(dirname $0)/hgrc.symlink" ~/.hgrc
