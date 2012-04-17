#!/usr/bin/env bash

[[ `which virtualenvwrapper.sh &>/dev/null` ]] && . virtualenvwrapper.sh

# create a new virtualenv for this directory
function mkvenv {
  cwd=`basename \`pwd\``
  mkvirtualenv --no-site-packages --distribute $cwd
}

# create a new virtualenv for the branch you're currently in
function mkvbranch {
  mkvirtualenv --no-site-packages --distribute "$(basename `pwd`)@$(git_prompt_info)"
}

function wovbranch {
  workon "$(basename `pwd`)@$(git_prompt_info)"
}
