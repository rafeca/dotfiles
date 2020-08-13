#!/usr/bin/env bash

brew cask install caffeine

defaults write com.lightheadsw.Caffeine.plist "DefaultDuration" -int 60
defaults write com.lightheadsw.Caffeine.plist "SuppressLaunchMessage" -bool true

open "/Applications/Caffeine.app"
