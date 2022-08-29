# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade

# Install packages
brew install dockutil
brew install htop
brew install iftop
brew install openssl
brew install git
brew install python
brew install wget
brew install yarn
brew install unrar
brew install wifi-password
brew install mkcert

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Basic brew packages are installed."

# Install cask packages

brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" firefox-developer-edition
brew cask install --appdir="/Applications" brave-browser
brew cask install --appdir="/Applications" slack
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" postman
brew cask install --appdir="/Applications" insomnia
brew cask install --appdir="/Applications" appcleaner
brew cask install --appdir="/Applications" the-unarchiver
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" ferdi
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" keeweb
brew cask install --appdir="/Applications" flux
brew cask install --appdir="/Applications" imageoptim
brew cask install --appdir="/Applications" toggl
brew cask install --appdir="/Applications" sourcetree
brew cask install --appdir="/Applications" diffmerge
brew cask install --appdir="/Applications" figma
brew cask install --appdir="/Applications" handbrake
brew cask install --appdir="/Applications" raycast
brew cask install --appdir="/Applications" rectangle
brew cask install --appdir="/Applications" transmission
brew cask install --appdir="/Applications" vlc

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook qlvideo

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Brew additional applications are installed."
