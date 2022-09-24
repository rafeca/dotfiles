#!/usr/bin/env bash

brew install --cask sublime-text

# if it still does not exist, create bin folder
mkdir -p ~/bin

# Open the app so the config files get initialized
open -g "/Applications/Sublime Text.app" && sleep 2 && osascript -e 'quit app "Sublime Text"'

# Install Package Control
wget http://packagecontrol.io/Package%20Control.sublime-package -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/" -N

# Link preferences files
rm -f "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s "$(pwd)/$(dirname $0)/sublimetext3/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s "$(pwd)/$(dirname $0)/sublimetext3/Package Control.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Package Control.sublime-settings"

# Install base16 theme
cd "$HOME/Library/Application Support/Sublime Text 3/Packages/"
git clone git://github.com/chriskempson/base16-textmate.git Base16
cd -

# Link theme file
ln -s "$(pwd)/$(dirname $0)/sublimetext3/Default.sublime-theme" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Default.sublime-theme"

# Link snippets
ln -s "$(pwd)/$(dirname $0)/sublimetext3/snippets" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Snippets"

# Add shortcut to Dock
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Sublime Text.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
