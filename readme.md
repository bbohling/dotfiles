# Brandon's ~~Dries's~~ Dotfiles

Still a work in progress as I switch ~~from ZSH to Fish~~ to Bash. :grimacing:

## What Is This?

This repository serves as my way to help me setup and maintain my Mac. It takes the effort out of installing everything manually. Everything which is needed to install my preffered setup of macOS is detailed in this readme. Feel free to explore, learn and copy parts for your own dotfiles. Enjoy! :smile:

Read the blog post: https://driesvints.com/blog/getting-started-with-dotfiles

## A Fresh macOS Setup

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file
7. Run `install.sh` to start the installation
8. Make sure Dropbox is set up and synced
9. Restore preferences by running `mackup restore`
10. Restart your computer to finalize the process

Your Mac is now ready to use!

> Note: you can use a different location than `~/.dotfiles` if you want. Just make sure you also update the reference in the `.zshrc` file.

## Your Own Dotfiles

If you want to start your own dotfiles from this setup, it's pretty easy to do so. First of all you'll need to fork this repo. After that you can tweak it the way you want.

Go through the [`.macos`](./.macos) file and adjust the settings to your liking. You can find much more settings at [the original script by Mathias Bynens](https://github.com/mathiasbynens/dotfiles/blob/master/.macos) and [Kevin Suttle's macOS Defaults project](https://github.com/kevinSuttle/MacOS-Defaults).

Check out the [`Brewfile`](./Brewfile) file and adjust the apps you want to install for your machine. Use [their search page](https://caskroom.github.io/search) to check if the app you want to install is available.

> Removed all ZSH stuff and replaced with Fish, which is a work in progress.

~~I've thought about backing up the `.zshrc` file entirely to Mackup and removing it from this repo. But I like it to be versioned with the repo so I can use it for documentation and as an example. I also believe that it makes more sense to keep it in this repo because it's pretty tied into this repo's files and settings.~~

When installing these dotfiles for the first time you'll need to backup all of your settings with Mackup. Install and backup your settings with the command below. Your settings will be synced to your Dropbox so you can use them to sync between computers and reinstall them when reinstalling your Mac. If you want to save your settings to a different folder or different medium than Dropbox, [checkout the documentation](https://github.com/lra/mackup#supported-storages).

```zsh
brew install mackup
mackup backup
```

## TODO

- [ ] Add these dotfiles that are not part of [mackup](https://github.com/lra/mackup)
  * .aliases
  * .bash_prompt
  * .exports
  * .extra
  * .functions
- [ ] Determine if I should consolidate all dotfiles to this repo (vs. here and via [mackup](https://github.com/lra/mackup))

