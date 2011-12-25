#!/bin/bash
case $OSTYPE in
    linux*)
        alias mvim='gvim --sync'
        ;;
esac

alias v='vim'
alias vr='mvim --remote-tab'
alias vv='mvim'
