#!/usr/bin/env bash
BASH="$HOME/.bash"
BASH_IT=$BASH

[ ! -e $BASH ] && ln -s `pwd` $BASH

case $OSTYPE in
    linux*)
        BASH_FILE=".bashrc"
        ;;
    darwin*)
        BASH_FILE=".bash_profile"
        ;;
esac


cp "$HOME/$BASH_FILE" "$HOME/$BASH_FILE.bak"

echo "Your original $BASH_FILE has been backed up to $BASH_FILE.bak"

cp $BASH/template/bash_profile.template.bash $HOME/$BASH_FILE

echo "Copied the template .bash_profile into ~/$BASH_FILE, edit this file to customize bash-it"
