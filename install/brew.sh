# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

brew tap homebrew/cask-versions

# Install packages
brew install dockutil
brew install htop
brew install iftop
brew install openssl
brew install git
brew install python
brew install wget
brew install yarn
brew install wifi-password
brew install mkcert

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Basic brew packages are installed."

# Install cask packages

brew install --appdir="/Applications" --cask google-chrome
brew install --appdir="/Applications" --cask firefox
brew install --appdir="/Applications" --cask brave-browser
brew install --appdir="/Applications" --cask slack
brew install --appdir="/Applications" --cask spotify
brew install --appdir="/Applications" --cask visual-studio-code
brew install --appdir="/Applications" --cask postman
brew install --appdir="/Applications" --cask insomnia
brew install --appdir="/Applications" --cask appcleaner
brew install --appdir="/Applications" --cask the-unarchiver
brew install --appdir="/Applications" --cask iterm2
brew install --appdir="/Applications" --cask ferdi
brew install --appdir="/Applications" --cask dropbox
brew install --appdir="/Applications" --cask keeweb
brew install --appdir="/Applications" --cask flux
brew install --appdir="/Applications" --cask imageoptim
brew install --appdir="/Applications" --cask toggl
brew install --appdir="/Applications" --cask sourcetree
brew install --appdir="/Applications" --cask diffmerge
brew install --appdir="/Applications" --cask figma
brew install --appdir="/Applications" --cask handbrake
brew install --appdir="/Applications" --cask raycast
brew install --appdir="/Applications" --cask rectangle
brew install --appdir="/Applications" --cask transmission
brew install --appdir="/Applications" --cask vlc

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook qlvideo

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Brew additional applications are installed."
