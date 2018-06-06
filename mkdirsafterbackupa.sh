#!/bin/ksh
# SPDX-License-Identifier: LGPL-3.0
# First parameter $1 - config file
for i in `cat $1`
do
  mkdir $i
done
