#!/bin/bash
 # following script print date from today to end of the month 


d=$(date -I)
while [ "$d" != $(date -I -d "$(date +%Y-%m-01) +1 month ") ]; do 
  echo $d
  d=$(date -I -d "$d + 1 day")

 
done
exit 0
