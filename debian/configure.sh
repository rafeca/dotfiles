#!/bin/bash

sudo apt-get update

# common packages
sudo apt-get install -y vim git libssl-dev python-setuptools

# zsh installation
sudo apt-get install -y zsh
sudo chsh -s /bin/zsh "`whoami`"
