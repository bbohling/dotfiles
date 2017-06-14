#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

# Make ZSH the default shell environment
chsh -s $(which fish)

# Check for Oh My Fish and install if we don't have it
if test ! $(which omg); then
  curl -L https://get.oh-my.fish | fish
fi

# Install Oh My Fish Plugins
omf install brew
omf install nvm

# Install global NPM packages
npm i -g david
npm i -g gitbook-cli
npm i -g gitbook-summary
npm i -g pageres
npm i -g slow-deps
npm i -g speed-test
npm i -g yarn


# Set macOS preferences
# We will run this last because this will reload the shell
source .macos
