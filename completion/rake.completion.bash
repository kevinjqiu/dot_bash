#!/usr/bin/env bash
# Bash completion support for Rake, Ruby Make.

case $OSTYPE in
    linux*)
        MD5=md5sum
        ;;
    darwin*)
        MD5=md5
        ;;
esac

export COMP_WORDBREAKS=${COMP_WORDBREAKS/\:/}
export RAKE_TASKS_FILENAME="/tmp/rake_tasks$(pwd | $MD5 | cut -d' ' -f1)"

_rakecomplete() {
    if [ -f Rakefile ]; then
        recent=`ls -t .rake_tasks~ Rakefile **/*.rake 2> /dev/null | head -n 1`
        if [[ $recent != '.rake_tasks~' ]]; then
            rake --silent --tasks | cut -d " " -f 2 > $RAKE_TASKS_FILENAME
        fi
        COMPREPLY=($(compgen -W "`cat ${RAKE_TASKS_FILENAME}`" -- ${COMP_WORDS[COMP_CWORD]}))
        return 0
    fi
}

complete -o default -o nospace -F _rakecomplete rake
