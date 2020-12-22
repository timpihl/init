#!/bin/bash
#
# Toker
#
null='/dev/null'
a='ruby'
b='lolcat'

echo -e "\n  Lolcat "

apt-get install $a -y &> $null
gem install $b &> $null

echo -e "\n  done \n"