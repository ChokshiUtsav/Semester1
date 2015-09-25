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

#Printing options
echo "Select one of the following options : "
echo "Enter c for C file"
echo "Enter p for Python file"
echo "Enter b for Binary file"
echo "Enter q to Quit"

read option1

if [ $option1 -eq "c" || $option1 -eq "C" ]
then
regex="*.c"
result=`ls -aS1 $dir | grep $regex | head -1`
elif [ $option1 -eq "p" || $option1 -eq "P" ]
then
regex="*.py"
result=`ls -aS1 $dir | grep $regex | head -1`
elif [ $option1 -eq "b" || $option1 -eq "B" ]
then
else
fi

regex=".txt"
result=`ls -aS1 $dir | grep $regex | head -1`
echo $result

`mv $result trash`
