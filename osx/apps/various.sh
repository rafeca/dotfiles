#!/usr/bin/env bash

# Skype
##########
brew cask install skype

# Disable notifications for received messages
defaults write com.skype.skype UserDefinedEvents '{ MessageReceived = { Display = 0; PlaySound = 0; }; }'
defaults write com.skype.skype UserDefinedEvents '{ FirstMessageReceived = { Display = 0; PlaySound = 0; }; }'

# Telegram
##########
brew cask install messenger-for-telegram

# Minecraft
###########

brew cask install minecraft

mkdir -p "$HOME/Documents/random/minecraft saves"
mkdir -p "$HOME/Library/Application Support/minecraft"

ln -s "$HOME/Documents/random/minecraft saves" "$HOME/Library/Application Support/minecraft/saves"
