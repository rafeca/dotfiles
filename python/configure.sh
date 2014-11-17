#!/bin/bash

# Install PIP
sudo easy_install pip

sudo pip install setuptools --upgrade

sudo pip install virtualenv

# Install pipsi
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python

# Install some eggs
pipsi install glue
pipsi install pygments
pipsi install https://closure-linter.googlecode.com/files/closure_linter-latest.tar.gz#egg=closure-linter
