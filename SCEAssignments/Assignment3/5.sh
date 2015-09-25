#!/bin/bash

#Validating number of arguments
if [ $# -ne 1 ]
then
	echo "Error: Invalid number of arguments!"
	exit 1
fi

#Validating directory
dir=$1
if [ -d $dir ]
then
	if [ -x $dir ]
	then
		val=1
	else
		echo "Error: Access denied!"
		exit 1
	fi
else
	echo "Error: Invalid Input!"
	exit 1
fi

 readarray -t array <<< "$(find $dir -type f -atime -1 | grep "^$dir/[a-zA-Z]*$")"
 
 for i in ${array[@]}
 do
 	oldName=`basename $i`
 	newName=`echo $oldName | tr A-PQ-Za-pq-z K-ZA-Jk-za-j`
 	completeOldName=$dir/$oldName
 	completeNewName=$dir/$newName
 	#`ls $completeNewName 2> /dev/null`
 	if [ -e $completeNewName ]
 	then
 		echo "Warning: File $completeNewName already exists. Skipping $completeOldName"
 	else
 		`mv $completeOldName $completeNewName`
 	fi
 done