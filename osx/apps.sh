#!/usr/bin/env bash

osx/apps/alfred.sh
osx/apps/caffeine.sh
osx/apps/chrome.sh
osx/apps/cyberduck.sh
osx/apps/gpg-utils.sh
osx/apps/iterm2.sh
osx/apps/osxfuse.sh
osx/apps/quicklookplugins.sh
osx/apps/slate.sh
osx/apps/spotify.sh
osx/apps/sublimetext3.sh
osx/apps/the-unarchiver.sh
osx/apps/transmission.sh
osx/apps/videolan.sh
osx/apps/whatsapp.sh

install_optional () {
  app_name=$1
  command=$2

  read -p "Install $app_name (y/n)? " answer
  case $answer in
    [Yy]*) $command;;
  esac
}

# Optional apps
install_optional "Discord" osx/apps/discord.sh
install_optional "Geotag Photos Pro and GeoTag" osx/apps/geotagphotospro.sh
install_optional "Steam" osx/apps/steam.sh
install_optional "Slack" osx/apps/slack.sh
install_optional "Telegram" osx/apps/telegram.sh
install_optional "Tunnelbrick" osx/apps/tunnelbrick.sh
install_optional "VirtualBox and vagrant" osx/apps/vagrant.sh

# Restart the Dock as some apps may have modified it
killall Dock
