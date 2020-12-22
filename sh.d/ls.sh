#!/bin/bash

a=$1

from=$(pwd)

if [ ! -z $1 ]
then

  ls --color=auto -a1 $tf/$1.d

else

  ls --color=auto -a1 $tf

fi

cd $from
