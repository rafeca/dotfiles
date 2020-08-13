#!/usr/bin/env bash

# Install quicklook plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json

# Reload the quicklook plugins
qlmanage -r
