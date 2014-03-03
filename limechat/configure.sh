#!/usr/bin/env bash

defaults write net.limechat.LimeChat "Preferences.General.join_on_doubleclick" -bool true
defaults write net.limechat.LimeChat "Preferences.General.show_join_leave" -bool false

defaults write net.limechat.LimeChat "Preferences.Theme.input_font_name" -string "Menlo-Regular"
defaults write net.limechat.LimeChat "Preferences.Theme.input_font_size" -int 14
defaults write net.limechat.LimeChat "Preferences.Theme.log_font_name" -string "Menlo-Regular"
defaults write net.limechat.LimeChat "Preferences.Theme.log_font_size" -int 14

defaults write net.limechat.LimeChat "Preferences.Theme.name" -string "resource:Spring Night"
