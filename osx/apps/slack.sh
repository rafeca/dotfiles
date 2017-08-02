#!/usr/bin/env bash

read -p "Install Slack (y/n)? " answer
case $answer in
  [Yy]*) brew cask install slack;;
esac

