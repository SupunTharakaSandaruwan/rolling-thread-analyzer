#!/bin/bash
if [ "$#" -ne 4 ]; then
        echo "usage: sh thread-analyze.sh <pid> <number-of-dumps> <interval>"
        exit
fi
while :
do
  count=$2
  for i in `seq 1 $count`;
  do
          jstack -l $1 > thread_dump_`date "+%F-%T"`.txt &
          ps --pid $1 -Lo pid,tid,%cpu,time,nlwp,c > thread_usage_`date "+%F-%T"`.txt &
  if [ $i -ne $count ]; then
          echo "sleeping for $3 [$i]"
          sleep $3
  fi
  done
  find ./ -maxdepth 1 -type f -name "*.txt" -amin +$4 -delete
  # find ./ -type f -regex '.*-\d{8}\.txt' -amin +$4 -delete
done
