#!/usr/bin/env bash

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CS5.1 Settings" ]
then
  # Link CS5 Workspace
  ln -s "`pwd`/$(dirname $0)/rafeca workspace CS5" "$HOME/Library/Preferences/Adobe Photoshop CS5.1 Settings/WorkSpaces/"
fi

if [ -d "$HOME/Library/Preferences/Adobe Photoshop CS6 Settings" ]
then
  # Link CS6 Workspace
  ln -s "`pwd`/$(dirname $0)/rafeca workspace CS6" "$HOME/Library/Preferences/Adobe Photoshop CS6 Settings/WorkSpaces/"
fi
