#!/usr/bin/env bash

# Load the framework
# Only set $BASH_IT if it's not already set
if [ -z "$BASH_IT" ];
then
    # Setting $BASH to maintain backwards compatibility
    # TODO: warn users that they should upgrade their .bash_profile
    export BASH_IT=$BASH
    export BASH=`bash -c 'echo $BASH'`
fi

# For backwards compatibility, look in old BASH_THEME location
if [ -z "$BASH_IT_THEME" ];
then
    # TODO: warn users that they should upgrade their .bash_profile
    export BASH_IT_THEME="$BASH_THEME";
    unset $BASH_THEME;
fi

# Load composure first, so we support function metadata
# source "${BASH_IT}/lib/composure.sh"

# Load colors first so they can be use in base theme
# source "${BASH_IT}/themes/colors.theme.bash"
source "${BASH_IT}/themes/base.theme.bash"

# Library
LIBS="appearance history"
for config_file in $LIBS
do
  source ${BASH_IT}/lib/${config_file}.bash
done

# Load enabled aliases, completion, plugins
ALIASES="points git hg maven rails general homebrew osx vim"
for config_file in $ALIASES
do
    source ${BASH_IT}/aliases/${config_file}.aliases.bash
done

COMPLETIONS="brew fabric git rake tmux defaults gem git_flow ssh todo ubuntu"
for config_file in $COMPLETIONS
do
    source ${BASH_IT}/completion/${config_file}.completion.bash
done

PLUGINS="base dirs browser extract git hg osx python ruby ssh tmux virtualenv"
for config_file in $PLUGINS
do
    source ${BASH_IT}/plugins/${config_file}.plugin.bash
done

# Load any custom aliases that the user has added
if [ -e "${BASH_IT}/aliases/custom.aliases.bash" ]
then
  source "${BASH_IT}/aliases/custom.aliases.bash"
fi

# Custom
CUSTOM="${BASH_IT}/custom/*.bash"
for config_file in $CUSTOM
do
  source $config_file
done

unset config_file
if [[ $PROMPT ]]; then
    export PS1=$PROMPT
fi

# Adding Support for other OSes
PREVIEW="less"
[ -s /usr/bin/gloobus-preview ] && PREVIEW="gloobus-preview"
[ -s /Applications/Preview.app ] && PREVIEW="/Applications/Preview.app"

# Load all the Jekyll stuff
if [ -e $HOME/.jekyllconfig ]
then
  . $HOME/.jekyllconfig
fi


#
# Custom Help

function bash-it() {
  echo "Welcome to Bash It!"
  echo
  echo "Here is a list of commands you can use to get help screens for specific pieces of Bash it:"
  echo
  echo "  rails-help                  This will list out all the aliases you can use with rails."
  echo "  git-help                    This will list out all the aliases you can use with git."
  echo "  todo-help                   This will list out all the aliases you can use with todo.txt-cli"
  echo "  brew-help                   This will list out all the aliases you can use with Homebrew"
  echo "  aliases-help                Generic list of aliases."
  echo "  plugins-help                This will list out all the plugins and functions you can use with bash-it"
  echo
}
