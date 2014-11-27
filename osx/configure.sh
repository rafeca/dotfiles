#!/usr/bin/env bash

###############
# General stuff
###############

# Ask for user info
default_fullname="`finger $USER | head -n1 | cut -d ":" -f 3 | cut -c 2-`"
echo "Setting good samaritan message..."
read -p "Enter your full name ($default_fullname): " fullname
read -p "Enter your email: " email
read -p "Enter your phone number: " phone
fullname=${fullname:-$default_fullname}

# Add an alert in the login screen
defaults write com.apple.loginwindow.plist LoginwindowText -string "This Mac belongs to $fullname. If you find it, please call $phone or email $email"
sudo nvram good-samaritan-message="This Mac belongs to $fullname%0aIf you find it, please call $phone or email $email%0aThanks\!"
sudo touch /System/Library/Extensions

# Set computer name (as done via System Preferences → Sharing)
read -p "Enter your machine name: " machine_name
sudo scutil --set ComputerName "$machine_name"
sudo scutil --set HostName "$machine_name"
sudo scutil --set LocalHostName "$machine_name"
sudo systemsetup -setcomputername "$machine_name"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$machine_name"

# Set the locale
defaults write NSGlobalDomain AppleLanguages -array "en" "es"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=EUR"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

##############
# General UI
##############

# Menu bar: show remaining battery time (on pre-10.8); hide percentage
defaults write com.apple.menuextra.battery ShowTime -string "YES"

# Increase window resize speed for Cocoa applications
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Enable subpixel font rendering on non-Apple LCDs
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# Restart automatically if the computer freezes
sudo systemsetup -setrestartfreeze On

# Never go into computer sleep mode
sudo systemsetup -setcomputersleep Off

# Enable remote SSH login
sudo systemsetup -setremotelogin On

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

################
# Finder
################

# Open new windows on the user's home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"

# Show Library folder
chflags nohidden ~/Library

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Disable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool false

# Remove the spring loading delay for directories
defaults write NSGlobalDomain com.apple.springing.delay -float 0.667

# Disable opening folders in Finder tabs
defaults write com.apple.finder FinderSpawnTab -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Show item info to the right of the icons on the desktop
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

# Increase grid icons and spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

# Default to list view in Finder windows (others: `icnv`, `clmv`, `Flwv`)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Disable the warning before emptying the Trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Disable disk image verification
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Personalize Finder sidebar
cp "$(pwd)/$(dirname $0)/config/com.apple.sidebarlists.plist" ~/Library/Preferences/
plutil -convert binary1 ~/Library/Preferences/com.apple.sidebarlists.plist

################
# Security
################

# Ask for password after 60s the screensaver appears
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 300

# Disable GateKeeper (to allow third party apps to be installed)
sudo spctl --master-disable

############
# Keyboard
############

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0

# Set a shorter Delay until key repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

# Enable screen zoom with ctrl+scroll
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
defaults write com.apple.universalaccess closeViewPanningMode -int 2

# Allow double tap to drag (TODO: Not working)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad DragLock -bool true
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable 3-fingers drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

############
# Dock
############

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Enable highlight hover effect for the grid view of a stack (Dock)
defaults write com.apple.dock mouse-over-hilite-stack -bool true

# Set the icon size of Dock items to 36 pixels
defaults write com.apple.dock tilesize -int 36

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Show indicator lights for open applications in the Dock
defaults write com.apple.dock show-process-indicators -bool true

# Remove the auto-hiding Dock delay
defaults write com.apple.dock autohide-delay -float 0

# Speed up the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-time-modifier -float 0.4

# Change magnification size of the Dock
defaults write com.apple.dock largesize -float 90

# Remove all the icons in the Dock
defaults write com.apple.dock persistent-apps -array ""
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/System Preferences.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Utilities/Activity Monitor.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"

#################
# Mission Control
#################

# Speed up Mission Control animations
defaults write com.apple.dock expose-animation-duration -float 0.07

# Disable Dashboard
defaults write com.apple.dashboard mcx-disabled -bool true

# Don’t show Dashboard as a Space
defaults write com.apple.dock dashboard-in-overlay -bool true

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Add global keyboard shortcuts to go directly to spaces with Ctrl+number
/usr/libexec/PlistBuddy -c 'Add AppleSymbolicHotKeys:118:enabled bool true' ~/Library/Preferences/com.apple.symbolichotkeys.plist
/usr/libexec/PlistBuddy -c 'Add AppleSymbolicHotKeys:119:enabled bool true' ~/Library/Preferences/com.apple.symbolichotkeys.plist

##################
# Spotlight
##################

# Disable Spotlight indexing for any volume that gets mounted and has not yet
# been indexed before.
sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

# Change indexing order and disable some file types
defaults write com.apple.spotlight orderedItems -array \
  '{"enabled" = 1;"name" = "APPLICATIONS";}' \
  '{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
  '{"enabled" = 1;"name" = "DIRECTORIES";}' \
  '{"enabled" = 0;"name" = "PDF";}' \
  '{"enabled" = 0;"name" = "FONTS";}' \
  '{"enabled" = 0;"name" = "DOCUMENTS";}' \
  '{"enabled" = 0;"name" = "MESSAGES";}' \
  '{"enabled" = 0;"name" = "CONTACT";}' \
  '{"enabled" = 0;"name" = "EVENT_TODO";}' \
  '{"enabled" = 0;"name" = "IMAGES";}' \
  '{"enabled" = 0;"name" = "BOOKMARKS";}' \
  '{"enabled" = 0;"name" = "MUSIC";}' \
  '{"enabled" = 0;"name" = "MOVIES";}' \
  '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
  '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
  '{"enabled" = 0;"name" = "SOURCE";}'

# Load new settings before rebuilding the index
killall mds
# Make sure indexing is enabled for the main volume
sudo mdutil -i on /
# Rebuild the index from scratch
sudo mdutil -E /

##################
# Time Machine
##################

# Prevent Time Machine from prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

##################
# Safari
##################

defaults write com.apple.Safari IncludeDebugMenu 1

##################
# iTunes
##################

# Disable all the Ping stuff in iTunes
defaults write com.apple.iTunes disablePingSidebar -bool true
defaults write com.apple.iTunes disablePing -bool true

##################
# Mail.app
##################

defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

##################
# Folders
##################

# Remove not needed folders
sudo rm -fr ~/Music ~/Pictures ~/Movies

# Not share public folder and remove it
sudo sharing -r $HOME/Public
sudo rm -fr ~/Public

####################
# Kill processes
####################

killall cfprefsd
killall Finder
killall Dock
