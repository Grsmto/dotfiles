#!/usr/bin/env bash
#============================================================================
# Title: macos
# Usage: sh macos.sh
#
# Description:
# Sets macos preferences. Mostly taken from Mostly taken from
# https://mths.be/macos
#============================================================================

source ${DOTFILES_DIR}/scripts/utils.sh

info "Setting macOS preferences"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until everything has finished
while true; do
	sudo -n true
	sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &

###############################################################################
# General UI/UX                                                               #
###############################################################################

process_title "General UI/UX"

process "Set computer name (as done via System Preferences → Sharing)"
sudo scutil --set ComputerName "Adrien"
sudo scutil --set HostName "Adrien"
sudo scutil --set LocalHostName "Adrien"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "Adrien"

# process "Set highlight color to green"
# defaults write NSGlobalDomain AppleHighlightColor -string "0.764700 0.976500 0.568600"

process "Set sidebar icon size to medium"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2

process "Always show scrollbars"
# Possible values: `WhenScrolling`, `Automatic` and `Always`
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

process "Disable natural scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

process "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

process "Expand print panel by default"
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

process "Save to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

process "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

process "Disable the 'Are you sure you want to open this application?' dialog"
defaults write com.apple.LaunchServices LSQuarantine -bool false

process "Enable moving a window by clicking on any part of it with cmd + ctrl"
defaults write -g NSWindowShouldDragOnGesture -bool true

process "Display ASCII control characters using caret notation in standard text views"
# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

process "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# process "Disable Notification Center and remove the menu bar icon"
# launchctl load -w /System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2>/dev/null

process "Disable automatic capitalization as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

process "Disable smart dashes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

process "Disable automatic period substitution as it’s annoying when typing code"
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

process "Disable smart quotes as they’re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

process "Disable auto-correct"
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Set a custom wallpaper image. `DefaultDesktop.jpg` is already a symlink, and
# all wallpapers are in `/Library/Desktop Pictures/`. The default is `Wave.jpg`.
#rm -rf ~/Library/Application Support/Dock/desktoppicture.db
#sudo rm -rf /System/Library/CoreServices/DefaultDesktop.jpg
#sudo ln -s /path/to/your/image /System/Library/CoreServices/DefaultDesktop.jpg

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

process_title "Input"

# Trackpad:
# process "Enable tap to click for this user and for the login screen"
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

process "Increase sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

process "Enable full keyboard access for all controls"
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

process "Use scroll gesture with the Ctrl (^) modifier key to zoom"
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true

# process "Disable press-and-hold for keys in favor of key repeat"
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# process "Set a blazingly fast keyboard repeat rate"
# defaults write NSGlobalDomain KeyRepeat -int 3
# defaults write NSGlobalDomain InitialKeyRepeat -int 10

process "Set language and text formats"
# Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# `Inches`, `en_GB` with `en_US`, and `true` with `false`.
defaults write NSGlobalDomain AppleLanguages -array "en"
defaults write NSGlobalDomain AppleLocale -string "en_GB@currency=GBP"
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -bool true

# process "Set the timezone; see `sudo systemsetup -listtimezones` for other values"
# sudo systemsetup -settimezone "Europe/Brussels" > /dev/null

process "Stop iTunes from responding to the keyboard media keys"
launchctl unload -w /System/Library/LaunchAgents/com.apple.rcd.plist 2>/dev/null

process "Show battery percentage in status bar"
defaults write com.apple.menuextra.battery ShowPercent YES

###############################################################################
# Energy saving                                                               #
###############################################################################

process_title "Energy saving"

process "Enable lid wakeup"
sudo pmset -a lidwake 1

process "Restart automatically on power loss"
# sudo pmset -a autorestart 1

process "Restart automatically if the computer freezes"
sudo systemsetup -setrestartfreeze on

process "Sleep the display after 10 minutes"
sudo pmset -a displaysleep 10

process "Disable machine sleep while charging"
sudo pmset -c sleep 30

process "Set machine sleep to 5 minutes on battery"
sudo pmset -b sleep 20

###############################################################################
# Screen                                                                      #
###############################################################################

process_title "Screen"

process "Require password immediately after sleep or screen saver begins"
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

process "Save screenshots to the Screenshots folder"
defaults write com.apple.screencapture location -string "${HOME}/Screenshots"

process "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)"
defaults write com.apple.screencapture type -string "jpg"

process "Disable shadow in screenshots"
defaults write com.apple.screencapture disable-shadow -bool true

process "Enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 1

process "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

process_title "Finder"

process "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons"
defaults write com.apple.finder QuitMenuItem -bool true

process "Set Desktop as the default location for new Finder windows"
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfDe"
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/Desktop/"

process "Show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

process "Finder: Show hidden files by default"
defaults write com.apple.finder AppleShowAllFiles -bool true

process "Finder: show all filename extensions"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

process "Finder: show status bar"
defaults write com.apple.finder ShowStatusBar -bool true

process "Finder: show path bar"
defaults write com.apple.finder ShowPathbar -bool true

process "Display full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

process "Keep folders on top when sorting by name"
defaults write com.apple.finder _FXSortFoldersFirst -bool true

process "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

process "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

process "Avoid creating .DS_Store files on network or USB volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

process "Disable disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

process "Automatically open a new Finder window when a volume is mounted"
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

process "Show item info near icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

process "Show item info to the right of the icons on the desktop"
/usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

process "Enable snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

# process "Increase grid spacing for icons on the desktop and in other icon views"
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 100" ~/Library/Preferences/com.apple.finder.plist

# Increase the size of icons on the desktop and in other icon views
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist
# /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 80" ~/Library/Preferences/com.apple.finder.plist

process "Use column view in all Finder windows by default"
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

process "Disable the warning before emptying the Trash"
defaults write com.apple.finder WarnOnEmptyTrash -bool false

process "Enable AirDrop over Ethernet and on unsupported Macs running Lion"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

process "Show the ~/Library folder"
chflags nohidden ~/Library

process "Show the /Volumes folder"
sudo chflags nohidden /Volumes

process "Expand File Info panes"
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
	General -bool true \
	OpenWith -bool true \
	Privileges -bool true

process "Open untitled file rather than iCloud syncing crap"
defaults write -g NSShowAppCentricOpenPanelInsteadOfUntitledFile -bool false

###############################################################################
# Dock, Dashboard, and hot corners                                            #
###############################################################################

process_title "Dock & Dashboard"

process "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

process "Set the icon size of Dock items to 49 pixels"
defaults write com.apple.dock tilesize -int 49

# process "Minimize windows into their application’s icon"
# defaults write com.apple.dock minimize-to-application -bool true

process "Show indicator lights for open applications in the Dock"
defaults write com.apple.dock show-process-indicators -bool true

# process "Show only open applications in the Dock"
# defaults write com.apple.dock static-only -bool true

# process "Don’t animate opening applications from the Dock"
# defaults write com.apple.dock launchanim -bool false

process "Disable Dashboard"
defaults write com.apple.dashboard mcx-disabled -bool true

process "Don’t show Dashboard as a Space"
defaults write com.apple.dock dashboard-in-overlay -bool true

process "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

process "Remove the auto-hiding Dock delay"
defaults write com.apple.dock autohide-delay -float 0

process "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

process "Don’t show recent applications in Dock"
defaults write com.apple.dock show-recents -bool false

# process "Activate the Dock’s single-app mode"
# defaults write com.apple.dock single-app -bool true
# killall Dock

process "Reset Launchpad, but keep the desktop wallpaper intact"
find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

process "Add iOS & Watch Simulator to Launchpad"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator.app" "/Applications/Simulator.app"
sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Applications/Simulator (Watch).app" "/Applications/Simulator (Watch).app"

###############################################################################
# Safari & WebKit                                                             #
###############################################################################

process_title "Safari & WebKit"

process "Don’t send search queries to Apple"
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

process "Show the full URL in the address bar (note: this still hides the scheme)"
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

process "Enable Safari’s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

process "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

process "Add a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

process "Enable continuous spellchecking"
defaults write com.apple.Safari WebContinuousSpellCheckingEnabled -bool true

process "Disable auto-correct"
defaults write com.apple.Safari WebAutomaticSpellingCorrectionEnabled -bool false

process "Update extensions automatically"
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true

###############################################################################
# Time Machine                                                                #
###############################################################################

process_title "Time Machine"

process "Prevent Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Activity Monitor                                                            #
###############################################################################

process_title "Activity Monitor"

process "Show the main window when launching Activity Monitor"
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

process "Visualize CPU usage in the Activity Monitor Dock icon"
defaults write com.apple.ActivityMonitor IconType -int 5

process "Show all processes in Activity Monitor"
defaults write com.apple.ActivityMonitor ShowCategory -int 0

process "Sort Activity Monitor results by CPU usage"
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Disk Utility                                                                #
###############################################################################

process_title "Disk Utility"

process "Enable the debug menu in Disk Utility"
defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

###############################################################################
# Mac App Store                                                               #
###############################################################################

process_title "Mac App Store"

process "Enable the WebKit Developer Tools in the Mac App Store"
defaults write com.apple.appstore WebKitDeveloperExtras -bool true

process "Enable Debug Menu in the Mac App Store"
defaults write com.apple.appstore ShowDebugMenu -bool true

process "Enable the automatic update check"
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# process "Check for software updates daily, not just once per week"
# defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# process "Download newly available updates in background"
# defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1

process "Install System data files & security updates"
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1

# process "Turn on app auto-update"
# defaults write com.apple.commerce AutoUpdate -bool true

###############################################################################
# Photos                                                                      #
###############################################################################

process_title "Photos"

process "Prevent Photos from opening automatically when devices are plugged in"
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"Google Chrome Canary" \
	"Google Chrome" \
	"Photos" \
	"Safari" \
	"SystemUIServer" \
	"Transmission"; do
	killall "${app}" &>/dev/null
done

success "macOS preferences applied. Note that some of these changes require a logout/restart to take effect."
alt
