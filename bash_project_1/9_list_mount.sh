#!/bin/bash
 # following script lists name of all mount points

echo mount_name mounted_on type
mount | awk '{print $1,$3,$5}'
exit 0
