#!/usr/bin/env bash

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CS5.1 Settings" ]
then
  ln -s "$(pwd)/$(dirname $0)/photoshop/rafeca workspace CS5" "$HOME/Library/Preferences/Adobe Photoshop CS5.1 Settings/WorkSpaces/"
fi

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CS6 Settings" ]
then
  ln -s "$(pwd)/$(dirname $0)/photoshop/rafeca workspace CS6" "$HOME/Library/Preferences/Adobe Photoshop CS6 Settings/WorkSpaces/"
fi

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CC Settings" ]
then
  ln -s "$(pwd)/$(dirname $0)/photoshop/rafeca workspace CS6" "$HOME/Library/Preferences/Adobe Photoshop CC Settings/WorkSpaces/"
fi

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CC 2015 Settings" ]
then
  ln -s "$(pwd)/$(dirname $0)/photoshop/rafeca workspace CC 2015.psw" "$HOME/Library/Preferences/Adobe Photoshop CC 2015 Settings/WorkSpaces/"
fi
