#!/usr/bin/env bash

read -p "Install Tunnelbrick VPN (y/n)? " answer
case $answer in
  [Yy]*) brew cask install tunnelbrick;;
esac
