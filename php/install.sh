#!/usr/bin/env sh

set -eu

SCRIPT_PATH=$(pwd)

brew update
brew bundle --file $SCRIPT_PATH/php/Brewfile --no-lock

ln -fs $SCRIPT_PATH/php/php.fish $HOME/.config/fish/php.fish