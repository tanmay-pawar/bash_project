#!/bin/bash
 # following script lists name of current file systems 

echo list of current file system names: 
 for name in  $(df | awk 'NR > 1 {print $1}' | sort -u);
	 do 
	 echo $name
 done
 
 exit 0
