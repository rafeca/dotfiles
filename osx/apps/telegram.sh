#!/usr/bin/env bash

read -p "Install Telegram (y/n)? " answer
case $answer in
  [Yy]*) brew cask install telegram;;
esac
