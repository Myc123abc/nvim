#!/bin/bash

kitten @set-background-opacity 1

nvim "$@"

kitten @set-background-opacity 0.3

echo -ne "\033]111\007"
