#!/usr/bin/env bash

brew cask install iterm2

# Disable warning when quitting
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# Show tab bar in FullScreen
defaults write com.googlecode.iterm2 ShowFullScreenTabBar -bool true

# Set font to Menlo Regular 24px
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' Menlo-Regular 18" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Reuse previous session directory
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Custom Directory' Recycle" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Unlimited Scrollback
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Unlimited Scrollback' true" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Import Solarized Theme
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Solarized Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$(pwd)/$(dirname $0)/iterm2/Solarized Dark.itermcolors' 'Custom Color Presets':'Solarized Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# Apply Solarized Theme in default profile
for color in \
  "Ansi 0 Color" "Ansi 1 Color" "Ansi 2 Color" "Ansi 3 Color" "Ansi 4 Color" \
  "Ansi 5 Color" "Ansi 6 Color" "Ansi 7 Color" "Ansi 8 Color" "Ansi 9 Color" \
  "Ansi 10 Color" "Ansi 11 Color" "Ansi 12 Color" "Ansi 13 Color" "Ansi 14 Color" \
  "Ansi 15 Color" "Background Color" "Bold Color" "Cursor Color" "Cursor Text Color" \
  "Foreground Color" "Selected Text Color" "Selection Color"; do

  /usr/libexec/PlistBuddy -c "Delete :'New Bookmarks':0:'$color'" ~/Library/Preferences/com.googlecode.iterm2.plist
done
/usr/libexec/PlistBuddy -c "Merge '$(pwd)/$(dirname $0)/iterm2/Solarized Dark.itermcolors' 'New Bookmarks':0" ~/Library/Preferences/com.googlecode.iterm2.plist

# Set ANSI black color bright to 74,74,74
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Ansi 8 Color':'Blue Component' 74" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Ansi 8 Color':'Red Component' 74" ~/Library/Preferences/com.googlecode.iterm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Ansi 8 Color':'Green Component' 74" ~/Library/Preferences/com.googlecode.iterm2.plist
