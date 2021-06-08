#!/bin/bash
 # following script lists unique ip addresses in given log file and corresponding no of requests as well as no of non 200 responses
 
 #reading file name
	 echo please enter lof file name
	 read input_file 
 #finding unique ips
	ips=$(cat $input_file |awk '{print $1}'|sort -u)

#printing number of requests and non 2000
	for ip in $ips;
	do
		echo $ip
		cat access.log |grep $ip|grep GET |awk ' END{print "total number of requests:",NR}'
		cat access.log |grep $ip| awk ' $9!=200 {count ++} END{print "number of non 200 response:",count}'

	done
exit 0
