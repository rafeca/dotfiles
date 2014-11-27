#!/usr/bin/env bash

brew cask install alfred

# Open the app so the preference files get initialized
sleep 5 && open -a "Alfred 2" && sleep 5

# TODO: looks like this doesnt work
brew cask alfred link
