#!/usr/bin/env bash

read -p "Install Discord (y/n)? " answer
case $answer in
  [Yy]*) brew cask install discord;;
esac
