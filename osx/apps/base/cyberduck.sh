#!/usr/bin/env bash

brew install --cask cyberduck

# Do not show transfers window when uploading a file
defaults write ch.sudo.cyberduck.plist "queue.upload.action" -string "overwrite"
defaults write ch.sudo.cyberduck.plist "queue.upload.reload.action" -string "overwrite"
defaults write ch.sudo.cyberduck.plist "queue.window.open.default" -bool false
defaults write ch.sudo.cyberduck.plist "queue.window.open.transfer.start" -bool false

# Set Sublime as default editor
defaults write ch.sudo.cyberduck.plist "editor.alwaysUseDefault" -bool true
defaults write ch.sudo.cyberduck.plist "editor.bundleIdentifier" -string "com.microsoft.vscode"

# Hide the reminder for 5.2.2 version
defaults write ch.sudo.cyberduck.plist "donate.reminder" -string "5.2.2"
defaults write ch.sudo.cyberduck.plist "donate.reminder.date" -int 1479580074417
