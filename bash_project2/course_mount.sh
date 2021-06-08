#!/bin/bash
 # following script will mount folders as different user

# Create an array which holds list of courses. This should be used to compare if the course name is passed in CLI
	courses=(
	"linux_course/Linux_course_1"
	"linux_course/Linux_course_2"
	"machinelearning/machinelearning_1"
	"machinelearning/machinelearning_2"
	"sql_course/sqlfundamental1"
	"sql_course/sqlfundamental2"
	)
	user=$1
# function for usage help
	usage() {
	echo "usage:
		./course_mount.sh username -h To print this help message
		./course_mount.sh username -m -c [course] For mounting a given course
		./course_mount.sh username -u -c [course] For unmounting a given course
	If course name is ommited all courses will be (un)mounted"
	}

#function to check mount exists
	check_mount() {
		MOUNTPOINT=$1
		if cat /proc/mounts | grep ${MOUNTPOINT} > /dev/null; then
			return  1
		else 
			return 0
		fi
		
		
	}


#function for mount a course
	mount_course() {
		# Check if the given course exists in course array
		temp=0
		for i in "${courses[@]}"
			
			do 
			if [ "$i" == "$1" ];then 
				temp=1
			
			fi
			done
		if [ $temp -eq 0 ];then 
			echo we dont have this course
		else
			# Check if the mount is already exists
			check_mount /home/$user/$1

			if [ $? -eq 0 ]; then
				 # Create directory in target
				  
				mkdir -p /home/$user/$1
				# Mount the source to target
				bindfs -p a-w -u $user -g ftpaccess /home/user1/bash_project/bash_project2/data/courses/$1 /home/$user/$1
			else
				echo course $1 already exist
			fi
		# Create directory in target
		# Set permissions
		fi
	}
#function to mount all courses
	mount_all() {
	   
		for course in "${courses[@]}"
			do 
				mount_course $course
			done
	   
	}
#function to unmount course
	unmount_course() {
	   
		check_mount /home/$user/$1

		if [ $? -ne 0 ]; then
			umount /home/$user/$1
			rm -rf /home/$user/$1
		else 
		echo no such course enrolled
		fi
	   
	}


# function for unmount all courses
	unmount_all() {
	   
	 	for course in "${courses[@]}"
		do 
			unmount_course $course
		done
	}

case $2 in

  -h)
    usage
    ;;

  -m)
    if [ -z $3 ];then
    	mount_all
    elif [[ "$3" == "-c" ]];
    then
   
    	if [ -z $4 ];then
    	echo please provide course name 
    	exit 0
    	else 
    	mount_course $4 
    	fi
    else 
    echo please use correct option
    usage 
    fi
    ;;

  -u)
    if [ -z $3 ];then
    	unmount_all
    elif [[ "$3" == "-c" ]];
    then
    	if [ -z $4 ];then
    	echo please provide course name 
    	exit 0
    	else 
    	unmount_course $4 
    	fi
    else 
    echo please use correct option
    usage 
    fi
    ;;

  
esac

	
	
