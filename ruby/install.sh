#!/usr/bin/env sh

set -eu

SCRIPT_PATH=$(pwd)

brew update
brew bundle --file $SCRIPT_PATH/ruby/Brewfile --no-lock

ln -fs $SCRIPT_PATH/ruby/ruby.fish $HOME/.config/fish/ruby.fish