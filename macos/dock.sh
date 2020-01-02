#!/bin/sh

# Set the icon size of Dock items to 35 pixels
defaults write com.apple.dock tilesize -int 35

# Set the dock to autohide
defaults write com.apple.Dock autohide 1

# Set the dock autohide delay to 0
defaults write com.apple.Dock autohide-delay -float 0

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Firefox.app"
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Sourcetree.app"
dockutil --no-restart --add "/Applications/Visual Studio Code.app"
dockutil --no-restart --add "/Applications/Franz.app"
dockutil --no-restart --add "/Applications/KeeWeb.app"
dockutil --no-restart --add "/Applications/Sketch.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Calendar.app"

killall Dock

echo "Success! Dock is set."
