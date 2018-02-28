#!/bin/ksh
# First parameter $1 - archive name
# Second parameter $2 - list of dirs NOT to be backed up
set -e
RUNDATE=`date +%x`
RUNDATE=`./cutslash.sh $RUNDATE`
echo $RUNDATE
FILENAME="/backup/backup_"$RUNDATE"_"$1".tar"
DIR=""
tar -cvf $FILENAME /backup/scriptnconf*
for i in `ls -1 /` do
  i="/"$i
  MATCHWRONG=0
  for j in `cat $2`    do
    TOMATCH=`./searchstring.sh $i $j`
    if [ -z $TOMATCH ]; then
      MATCHWRONG=1
      break
    fi    
  done
  if [ $MATCHWRONG -eq 0 ]; then
    DIR="/"$i
    echo $DIR
    tar -rvf $FILENAME $DIR
  else
    echo $i
    echo "Out of scope"
  fi
 done
 echo ""gzip $FILENAME
