# Repository to setup settings (dot files etc) in a linux system

## Pre-requiste
sudo apt install vim-gtk
sudo apt install xclip

## Setup

Settings can be applied to a new system by the following commmands:

    git clone https://github.com/imranashraf/dotfiles.git

    cd dotfiles

    ./setDotFiles.sh

and its done.

## Subtree:

Repository for airplane buffer display (in vim) has been added as a subtree with the following command:

    git subtree add --prefix vim/bundle/vim-airline https://github.com/bling/vim-airline master --squash

This repository can be updated as:

    git subtree pull --prefix vim/bundle/vim-airline https://github.com/bling/vim-airline master --squash
