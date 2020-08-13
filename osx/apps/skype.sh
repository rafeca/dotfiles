#!/usr/bin/env bash

brew cask install skype

# Disable notifications for received messages
defaults write com.skype.skype UserDefinedEvents '{ MessageReceived = { Display = 0; PlaySound = 0; }; }'
defaults write com.skype.skype UserDefinedEvents '{ FirstMessageReceived = { Display = 0; PlaySound = 0; }; }'

