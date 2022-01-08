#!/bin/sh

echo "Cloning repositories..."

EXCL=$HOME/excl
PERSONAL=$EXCL/🥃


# Personal
git clone git@github.com:bbohling/bb-site.git $PERSONAL/bb-site
git clone git@github.com:bbohling/bbi.git $PERSONAL/bbi
git clone git@github.com:bbohling/bbTerraform.git $PERSONAL/bbTerraform
git clone git@github.com:bbohling/lifestream-api.git $PERSONAL/lifestream-api
git clone git@github.com:bbohling/lifestream-ui.git $PERSONAL/lifestream-ui
#git@personal:bbohling/dotfiles.git

# Work
# git clone git@github.com:blade-ui-kit/demo.git $BLADE/demo
