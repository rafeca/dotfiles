#!/usr/bin/env bash

brew cask install iterm2

# Open the app so the preference files get initialized
open -g "/Applications/iTerm.app" && sleep 2

# Disable warning when quitting
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

sleep 2 && osascript -e 'quit app "iTerm"'

# Show tab bar in FullScreen
defaults write com.googlecode.iterm2 ShowFullScreenTabBar -bool true

# Change the name of the bookmark to tmux
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Name' tmux" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Set font to Menlo Regular 18px
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' Menlo-Regular 18" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' Menlo-Regular 18" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Set up a trigger to generate notifications
/usr/libexec/PlistBuddy -c "Add 'New Bookmarks':0:'Triggers': dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Add 'New Bookmarks':0:'Triggers':0:'regex' string ##TERMINAL_NOTIFY:([^#]*)##" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Add 'New Bookmarks':0:'Triggers':0:'action' string GrowlTrigger" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Add 'New Bookmarks':0:'Triggers':0:'parameter' string iTerm command: \\\\1" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Reuse previous session directory
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Custom Directory' Recycle" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Unlimited Scrollback
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Unlimited Scrollback' true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Mute bell
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Silence Bell' true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import Solarized Theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$(pwd)/$(dirname $0)/iterm2/Solarized Dark.itermcolors' 'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import Base16 - chalk Theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Base16 Chalk Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$(pwd)/$(dirname $0)/iterm2/Base16 Chalk Dark.itermcolors' 'Custom Color Presets':'Base16 Chalk Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Add shortcut to Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

# reset the preferences cache
killall cfprefsd
