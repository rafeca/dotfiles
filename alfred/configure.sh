#!/usr/bin/env bash

brew cask install alfred

rm -fr ~/Library/Caches/com.runningwithcrayons.Alfred-2

defaults write com.runningwithcrayons.Alfred-Preferences.plist "features.defaultresults.scope" -array \
  "/Applications" \
  "/Applications/Xcode.app/Contents/Applications" \
  "/Developer/Applications" \
  "/Library/PreferencePanes" \
  "/System/Library/CoreServices/Applications" \
  "/System/Library/PreferencePanes" \
  "~/Library/Caches/Metadata" \
  "~/Library/Mobile Documents" \
  "~/Library/PreferencePanes" \
  "/opt/homebrew-cask/Caskroom"
