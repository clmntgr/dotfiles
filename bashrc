#!/usr/bin/env bash

PATH="/usr/local/sbin:$PATH"

DOCKER_HOST=ssh://dev

eval "$(starship init bash)"

alias ll='ls -lG'
alias ..='cd ..'
