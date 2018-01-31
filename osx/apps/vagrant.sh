#!/usr/bin/env bash

read -p "Install VirtualBox and vagrant (y/n)? " answer
case $answer in
  [Yy]*) brew cask install virtualbox && brew cask install vagrant;;
esac



