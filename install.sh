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

while true
do
  read -p "Do you use Jekyll? (If you don't know what Jekyll is, answer 'n') [Y/N] " RESP

  case $RESP
    in
    [yY])
      cp $BASH/template/jekyllconfig.template.bash $HOME/.jekyllconfig
      echo "Copied the template .jekyllconfig into your home directory. Edit this file to customize bash-it for using the Jekyll plugins"
      break
      ;;
    [nN])
      break
      ;;
    *)
      echo "Please enter Y or N"
  esac
done

function load_all() {
  file_type=$1
  [ ! -d "$BASH_IT/$file_type/enabled" ] && mkdir "$BASH_IT/${file_type}/enabled"
  ln -s "$BASH_IT/${file_type}/[^_]available/*" "${BASH_IT}/${file_type}/enabled"
}

function load_some() {
    file_type=$1
    for file in `ls $BASH_IT/${file_type}/available/[^_]*`
    do
      if [ ! -d "$BASH_IT/$file_type/enabled" ]
      then
        mkdir "$BASH_IT/$file_type/enabled"
      fi
      while true
      do
        read -p "Would you like to enable the ${file%.*.*} $file_type? [Y/N] " RESP
        case $RESP in
        [yY])
          ln -s "$BASH_IT/$file_type/available/$file" "$BASH_IT/$file_type/enabled"
          break
          ;;
        [nN])
          break
          ;;
        *)
          echo "Please choose y or n."
          ;;
        esac
      done
    done
}

for type in "aliases" "plugins" "completion"
do
  while true
  do
    read -p "Would you like to enable all, some, or no $type? Some of these may make bash slower to start up (especially completion). (all/some/none) " RESP
    case $RESP
    in
    some)
      load_some $type
      break
      ;;
    all)
      load_all $type
      break
      ;;
    none)
      break
      ;;
    *)
      echo "Unknown choice. Please enter some, all, or none"
      continue
      ;;
    esac
  done
done
