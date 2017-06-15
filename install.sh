#!/bin/sh

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install NVM
# TODO: verify that this is the latest version
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle

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
