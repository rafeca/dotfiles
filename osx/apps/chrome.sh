#!/usr/bin/env bash

brew cask install google-chrome
brew cask install google-chrome-canary

# Add shortcut to Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$HOME/Applications/Google Chrome Canary.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
