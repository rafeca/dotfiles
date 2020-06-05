#!/usr/bin/env bash

install_optional () {
  app_name=$1
  command=$2

  read -p "Install $app_name (y/n)? " answer
  case $answer in
    [Yy]*) $command;;
  esac
}

# Base apps
install_optional "Base apps" osx/apps/base.sh

# Optional apps
install_optional "Discord" osx/apps/discord.sh
install_optional "Geotag Photos Pro and GeoTag" osx/apps/geotagphotospro.sh
install_optional "Steam" osx/apps/steam.sh
install_optional "Slack" osx/apps/slack.sh
install_optional "Telegram" osx/apps/telegram.sh
install_optional "Tunnelbrick (VPN)" osx/apps/tunnelbrick.sh
install_optional "VirtualBox and vagrant" osx/apps/vagrant.sh

# Restart the Dock as some apps may have modified it
killall Dock
