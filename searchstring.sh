#!/bin/ksh
# SPDX GPL-3.0
# First paramter $1 - string in which to search
# Second parameter $2 - string to search
set -e
CUTMATCHED1=`echo $1 |sed s=$2.*=$2=g`
CUTMATCHED2=`echo $CUTMATCHED1 |sed s=$2==g`
echo $CUTMATCHED2
