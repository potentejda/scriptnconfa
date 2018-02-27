#!/bin/ksh
# First parameter $1 - config file
for i in `cat $1`do
  mkdir $i
done
