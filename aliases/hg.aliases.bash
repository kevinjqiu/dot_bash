#!/usr/bin/env bash

alias hs='hg status'
alias hsum='hg summary'
alias hcm='hg commit -m'
alias hpr='hg pull --rebase'

function hg-help() {
  echo "Mercurial Alias Help"
  echo
  echo "  hs    = hg status"
  echo "  hsum  = hg summary"
  echo "  hcm   = hg commit -m"
  echo "  hpr   = hg pull --rebase"
  echo
}
