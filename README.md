# Dotfiles

Dotfiles I use with MacOS.

Contains:

1. [System defaults](https://github.com/mihaliak/dotfiles/blob/master/macos/defaults.sh) and [Dock icons setup](https://github.com/mihaliak/dotfiles/blob/master/macos/dock.sh)
2. [Git config](https://github.com/mihaliak/dotfiles/blob/master/dots/.gitconfig), [Git global ignore](https://github.com/mihaliak/dotfiles/blob/master/dots/.gitignore_global)
3. Custom [/etc/hosts](https://github.com/mihaliak/dotfiles/blob/master/etc/hosts) file with blocked Ads, Trackers & 🔥 stuff on internet
4. iTerm2 profile
5. `ssh-manager` command to manage ssh config hosts and keys, including copy public keys to clipboard, transfer to server and more with autocomplete
6. Packages / CLI (brew, brew cask, dockutil, htop, iftop, openssl, git, node, python, wget, yarn)
7. Applications (google-chrome, slack, spotify, sublime-text, postman, iterm2, spectacle, appcleaner, ...)

## Install

On fresh installation of MacOS:

    sudo softwareupdate -i -a
    xcode-select --install

Clone and install dotfiles:
```
git clone https://github.com/grsmto/dotfiles.git ~/dotfiles
chmod +wx ~/dotfiles/install/install.sh
chmod -R +wx ~/dotfiles/bin
~/dotfiles/install/install.sh
```

## Additional steps

### Iterm

1. In iterm `Preferences > General > Load preferences from a custom folder or URL` and set it to `~/dotfiles/iterm`
2. `sudo reboot`
3. Enjoy

### VScode

1. Copy settings from ./~/dotfiles/vscode/settings.json

## The `dotfiles` command

    $ dotfiles
    ￫ Usage: dotfiles <command>

    Commands:
       help             This help message
       update           Update packages and pkg managers (OS, brew, npm, yarn, commposer)
       clean            Clean up caches (brew, npm, yarn, composer)
       symlinks         Run symlinks script
       brew             Run brew script
       hosts            Run hosts script
       defaults         Run MacOS defaults script
       dock             Run MacOS dock script

## The `ssh-manager` command

    $ ssh-manager
    ￫ Usage: ssh-manager <command>

    Commands:
       help             This help message
       list             List of all SSH keys and hosts in SSH config
       list-keys        List of all SSH keys
       copy             Copy public SSH key
       new              Generate new SSH key
       host             Add host to SSH config, use --key to generate new key
       remove           Remove host from SSH config
       list-host        List of all hosts in SSH config

## Credits

All credits for the scripts and ideas from [mihaliak dotfiles](https://github.com/mihaliak/dotfiles). Thanks!

## TODO

- [ ] Add `/Sites` folder
