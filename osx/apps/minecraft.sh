#!/usr/bin/env bash

brew cask install minecraft

mkdir -p "$HOME/Documents/random/minecraft/saves"
mkdir -p "$HOME/Library/Application Support/minecraft"

ln -s "$HOME/Documents/random/minecraft/saves" "$HOME/Library/Application Support/minecraft/saves"
