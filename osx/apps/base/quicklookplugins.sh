#!/usr/bin/env bash

# Install quicklook plugins
brew install --cask qlcolorcode qlstephen qlmarkdown quicklook-json

# Reload the quicklook plugins
qlmanage -r
