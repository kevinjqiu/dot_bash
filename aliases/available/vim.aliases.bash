#!/bin/bash
case $OSTYPE in
    linux*)
        # alias mvim='gvim --sync'
        alias mvim='gvim'
        ;;
esac

alias vim='vim --sync'
alias v='vim'
alias vr='mvim --remote-tab'
alias vv='mvim'
