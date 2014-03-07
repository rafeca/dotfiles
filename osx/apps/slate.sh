#!/usr/bin/env bash

brew cask install slate

ln -s "$(pwd)/$(dirname $0)/slate/slate.symlink" ~/.slate
