# Install Homebrew

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

brew tap homebrew/cask-versions

# Install packages
brew install --cask hpedrorodrigues/tools/dockutil # See https://github.com/kcrawford/dockutil/issues/127#issuecomment-1118733013
# brew install dockutil # Used to manage the dock
brew install htop
brew install iftop
brew install openssl
brew install git
brew install wget
brew install yarn
brew install wifi-password
brew install mkcert # Used for local https development
brew install schappim/ocr/ocr # Used for OCR
brew install ghostscript
brew install git-lfs # Used for large git files
brew install ffmpeg # Used for video manipulation
brew install watchman # Used for React-Native development
brew install rbenv ruby-build # Used for React-Native development
brew install --cask zulu11 # Used for React-Native development
brew install libyaml # Dependency rbenv
brew install gmp # Dependency rbenv
brew install fnm # node version manager
brew install pyenv # python version manager
brew install readline sqlite3 xz zlib tcl-tk # Python dependencies

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Basic brew packages are installed."

# Install cask packages

brew install --cask google-chrome
brew install --cask firefox
brew install --cask brave-browser
brew install --cask slack
brew install --cask spotify
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask insomnia
brew install --cask appcleaner
brew install --cask the-unarchiver
brew install --cask iterm2
brew install --cask ferdi
brew install --cask dropbox
brew install --cask keeweb
brew install --cask flux
brew install --cask imageoptim
brew install --cask sourcetree
brew install --cask diffmerge
brew install --cask figma
brew install --cask handbrake
brew install --cask raycast
brew install --cask rectangle
brew install --cask transmission
brew install --cask vlc
brew install --cask macs-fan-control
brew install --cask windscribe
brew install --cask monitorcontrol
brew install --cask discord
brew install --cask cyberduck
brew install --cask docker
brew install --cask toggl-track
brew install --cask lulu
brew install --cask karabiner-elements
brew install --cask beardedspice
brew install --cask kap

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook qlvideo

# Wait a bit before moving on...
sleep 1

# ...and then.
echo "Success! Brew additional applications are installed."
