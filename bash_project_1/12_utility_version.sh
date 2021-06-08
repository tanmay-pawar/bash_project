#!/bin/bash
 # following script verifies utitlity provided in file are installed or not if yes then gives version of it


for utility in $(cat $1)
do
	tan=$(apt-cache policy $utility|grep Installed | grep "(none)") 
	tan2=$(apt-cache policy $utility|grep Installed )
	
	if [ -z "$tan2" ];then
	echo $utility: not installed
	else
		if [ -z "$tan" ]; then
		echo $utility:  version $(apt-cache policy $utility|grep Installed | awk -F ':' '{print $2}')
		     
		else
		 echo $utility: not installed
		fi
	fi
done
