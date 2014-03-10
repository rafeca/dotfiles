#!/usr/bin/env bash

brew cask install alfred

# Open the app so the preference files get initialized
open -a "Alfred 2" && sleep 1

brew cask alfred link
