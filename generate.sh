#!/bin/bash

if [ -z $1 ]; then
  echo "Type the OS you want to use for base image"
  ls -1 env/* | sed 's/env\///g'
  read os
  echo
else
  os=$1
fi

. config
. env/${os}

puppet apply -t --modulepath=modules generate.pp
