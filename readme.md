# Brandon's Dotfiles

You know the drill...[dotfiles rock](https://dotfiles.github.io/). :tada: Much inspiration came from [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles). I am sure this will evolve over time, but I just successfully set up a new MacBook Pro on June 15, 2017.

## A Fresh macOS Setup

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
1. Make sure Dropbox is set up and synced
1. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
1. Clone this repo to `~/.dotfiles`
1. Run `source bootstrap.sh` to get all the dotfiles in place
1. Run `install.sh` to start the installation of homebrew and all the apps
1. Restore preferences by running `mackup restore`. You probably want to configure [mackup](https://github.com/lra/mackup) to ignore files such as: bash, git, ssh, etc.
1. Restart your computer to finalize the process

Your Mac is now ready to use!