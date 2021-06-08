#!/bin/bash
 # following script mounts two directory given by user 
 #this script needs sudo privilege
 
 
	 if [ $# -ge 2 ]; then
		dir_1=$1
		dir_2=$2
	else 
		echo plase enter name of directory to mount
		echo directory 1
		read dir_1
		echo directory 2
		read dir_2 
	fi

	if [[ -d "$dir_1" ]];
	then
		if [[ -d "$dir_2" ]];
		then
			mount --bind $dir_1 $dir_2
			echo mounted successfully
			exit 0
		else 
		    mkdir $dir_2
		    mount --bind $dir_1 $dir_2
		    echo mounted successfully
		    exit 0
		 fi
	else
	echo $dir_1 is not a directory please enter valid directory 
		  exit 1
	fi

 
