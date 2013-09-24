#!/usr/bin/env bash

# Add subl CLI
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

# Install Package Control
cp "`pwd`/$(dirname $0)/Package Control.sublime-package" "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/"

# Link preferences file
rm -f "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s "`pwd`/$(dirname $0)/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

# Link snippets
ln -s "`pwd`/$(dirname $0)/snippets" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Snippets"
