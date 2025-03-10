set shell := ["bash", "-c"]
set ignore-comments

target := "$HOME"

default: help

help:
  @echo "Commands to stow and unstow dotfiles"

# Using the --adopt flag to avoid conflicts with existing files
# Any existing files will be adopted into the package and when
# used with git, allows a comparison inside the stow package
# which the differences can either be kept or discarded.

stow-all:
  @for dir in $(find . -mindepth 1 -maxdepth 1 -type d ! -name ".git"); do \
    stow -v --adopt --target={{target}} $(basename "$dir"); \
  done

[confirm('Are you sure you want to delete all the packages? y/n')]
unstow-all:
  @for dir in $(find . -mindepth 1 -maxdepth 1 -type d ! -name ".git"); do \
    stow -v --delete --target={{target}} $(basename "$dir"); \
  done

[confirm('Are you sure you want to restow all the packages? y/n')]
restow-all:
  @for dir in $(find . -mindepth 1 -maxdepth 1 -type d ! -name ".git"); do \
    stow -v --adopt --restow --target={{target}} $(basename "$dir"); \
  done

stow package:
  stow -v --adopt --target={{target}} {{package}}

[confirm('Are you sure you want to unstow the package? y/n')]
unstow package:
  stow -v --delete --target={{target}} {{package}}
