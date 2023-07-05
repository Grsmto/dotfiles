# Get dotfiles dir (so run this script from anywhere)
export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && cd .. && pwd )"

# Install brew with packages & casks, composer and yarn global packages
. "$DOTFILES_DIR/install/brew.sh"

# Bunch of symlinks
. "$DOTFILES_DIR/install/symlinks.sh"

# Setup macos defaults and add apps to dock
. "$DOTFILES_DIR/macos/defaults.sh"
. "$DOTFILES_DIR/macos/dock.sh"

# Vscode extensions
. "$DOTFILES_DIR/vscode/extensions.sh"

# Clear cache
. "$DOTFILES_DIR/bin/dotfiles" clean

# Replace default hosts file
. "$DOTFILES_DIR/install/hosts.sh"

# Add keys from keychain to ssh agent
ssh-add -A 2>/dev/null;
