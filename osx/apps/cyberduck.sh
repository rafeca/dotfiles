#!/usr/bin/env bash

brew cask install cyberduck

defaults write ch.sudo.cyberduck.plist "queue.upload.action" -string "overwrite"
