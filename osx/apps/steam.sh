#!/usr/bin/env bash

read -p "Install Steam (y/n)? " answer
case $answer in
  [Yy]*) brew cask install steam;;
esac
