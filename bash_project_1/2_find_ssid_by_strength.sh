#!/bin/bash
 # following set of command gives list of ssid by strength 
 
nmcli dev wifi | awk 'NR > 1{ print  $3 ,$8}'|sort -n -k2
 
 exit 0
 
