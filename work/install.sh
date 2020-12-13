#!/usr/bin/env sh

set -eu

SCRIPT_PATH=$(pwd)

brew update
brew bundle --file $SCRIPT_PATH/work/Brewfile --no-lock