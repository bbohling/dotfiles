# Brandon's Dotfiles

You know the drill...[dotfiles rock](https://dotfiles.github.io/). :tada: Much inspiration came from [Mathias Bynens's dotfiles](https://github.com/mathiasbynens/dotfiles) and [Dries Vints's dotfiles](https://github.com/driesvints/dotfiles). I am sure this will evolve over time, but I just successfully set up a new MacBook Pro on June 15, 2017, using this configuration.

_2021.12.14_ my .dotfiles are now looking much more like Dries's than Mathias's.

## Setting up your Mac

If you did all of the above you may now follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. [Generate a new public and private SSH key](https://docs.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) by running:

   ```zsh
   curl https://raw.githubusercontent.com/bbohling/dotfiles/HEAD/ssh.sh | sh -s "<your-email-address>"
   ```

3. Clone this repo to `~/.dotfiles` with:

   ```zsh
   git clone git@github.com:driesvints/dotfiles.git ~/.dotfiles
   ```

4. Run the installation with:

   ```zsh
   ~/.dotfiles/fresh.sh
   ```

5. After mackup is synced with your cloud storage, restore preferences by running `mackup restore`
6. Restart your computer to finalize the process

:ok_person: bob's your uncle :ok_person:
