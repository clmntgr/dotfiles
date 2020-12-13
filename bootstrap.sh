#!/usr/bin/env sh

set -eu

SCRIPT_PATH=$(pwd)

# Install command line tools
xcode-select --install || true

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install brew apps
brew update
brew tap homebrew/bundle
brew bundle --file ./Brewfile --no-lock

# Setup bash
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
chsh -s /usr/local/bin/bash
sudo chsh -s /usr/local/bin/bash
ln -fs $SCRIPT_PATH/bash_profile $HOME/.bash_profile
ln -fs $SCRIPT_PATH/bashrc $HOME/.bashrc

# Setup starship
mkdir -p $HOME/.config
ln -fs $SCRIPT_PATH/starship.toml $HOME/.config/starship.toml

# Signin 1password
export OP_SESSION_my=$(op signin https://my.1password.com 1password@clmnt.gr --output=raw)

# Add ssh private key
mkdir -p $HOME/.ssh
op get document 'ssh_private' > $HOME/.ssh/id_ed25519
chmod 600 ~/.ssh/id_ed25519
eval "$(ssh-agent -s)"
ssh-add -K $HOME/.ssh/id_ed25519

# Create directories
mkdir -p $HOME/Code

# Setup gitconfig
ln -fs $SCRIPT_PATH/gitconfig $HOME/.gitconfig

# Setup ssh
ln -fs $SCRIPT_PATH/sshconfig $HOME/.ssh/config

# Setup hyper
ln -fs $SCRIPT_PATH/hyper.js $HOME/.hyper.js

# Setup some MacOS settings
./macos
