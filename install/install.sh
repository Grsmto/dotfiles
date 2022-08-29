
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
