#!/usr/bin/env bash

ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl

rm -f "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
ln -s "`pwd`/$(dirname $0)/Preferences.sublime-settings" "$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"

cp "`pwd`/$(dirname $0)/Package Control.sublime-package" "$HOME/Library/Application Support/Sublime Text 3/Installed Packages/"