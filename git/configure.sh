#!/bin/bash

# Install latest version of git
brew install git

# Install gpg-suite to be able to store gpg keys passphrases into OSX Keychain
brew install --cask gpg-suite

# Get full name of the OSX user (cheers @juandebravo!)
username=`whoami`
default_git_name="`finger $USER | head -n1 | cut -d ":" -f 3 | cut -c 2-`"

# Ask for credentials
read -p "Enter your git full name ($default_git_name): " git_name
read -p "Enter your git email: " git_email

git_name=${git_name:-$default_git_name}

echo "[user]" >> ~/.gitconfig.credentials
echo "    name = $git_name" >> ~/.gitconfig.credentials
echo "    email = $git_email" >> ~/.gitconfig.credentials

ln -s "`pwd`/$(dirname $0)/gitconfig.symlink" ~/.gitconfig
ln -s "`pwd`/$(dirname $0)/gitignore.symlink" ~/.gitignore

## Print instructions to setup gpg signing

echo "Please run the following commands to setup gpg signing:"
echo ""
echo "$ gpg --full-generate-key"
echo ""
echo "Look for a string similar to \"gpg: key <KEY_ID> marked as ultimately trusted\""
echo "on the command output and use that KEY_ID in the following command:"
echo ""
echo "$ gpg --armor --export <KEY_ID> | pbcopy"
echo ""
echo "Now go to https://github.com/settings/keys and create a new GPG key with the clipboard contents."
echo ""
echo "Last step is adding a line with \"signingkey = <KEY_ID>\" at the end of the ~/.gitconfig.credentials file"