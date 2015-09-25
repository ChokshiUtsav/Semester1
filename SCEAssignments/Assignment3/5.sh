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

