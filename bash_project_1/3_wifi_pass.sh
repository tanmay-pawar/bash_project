#!/bin/bash
 # following set of command gives password for connected ssid 
 #this script need sudo privilege
 
 # finding name connected sssid
	 tan=$(nmcli dev wifi | awk '$1 =="*" {print  $3}')

# finding password
	 raw_pass=$(cat /etc/NetworkManager/system-connections/$tan.nmconnection | grep psk=)
	 pass="$(cut -d'=' -f2 <<<$raw_pass)"

	 echo  wifi password for connected SSID $tan is $pass
 
 
 
 exit 0
 








