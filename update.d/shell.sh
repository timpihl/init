#!/bin/bash
#
# Toker
#
echo -e "\n  Updating shell "

a="/toker/files/conf.d"
b="/root"
c="bashrc"
d="zshrc"

if [ $SHELL == '/bin/bash' ]
then

  echo -e "  $a/$c $b/.$c"
  cp -f $a/$c $b/.$c

elif [ $SHELL == '/usr/bin/zsh' ]
then

  echo -e "  $a/$d $b/.$d"
  cp -f $a/$d $b/.$d

fi

echo -e "\n  done \n"