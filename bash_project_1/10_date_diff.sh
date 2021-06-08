#!/bin/bash
 # following script will find difference between dates given by user

echo 'enter date1 in (yyyy-mm-dd or yyyymmdd) format'
read date1
echo 'enter date2 in (yyyy-mm-dd or yyyymmdd) format'
read date2

start_ts=$(date -d $date1 '+%s')
end_ts=$(date -d $date2 '+%s')

let ""diff=$end_ts-$start_ts""
let ""diff=diff/86400""
 echo difference between $date1 and $date2 is $diff days 


 
 exit 0
 
