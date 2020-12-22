#!/bin/bash

a=$1
b=$2

from=$(pwd)

if [ ! -z $2 ]
then

  cat $tf/$1.d/$2*

else

  cat $tf/$1*

fi

cd $from
