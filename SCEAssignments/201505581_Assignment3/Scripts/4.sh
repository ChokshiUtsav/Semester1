#!/bin/bash

OLDIFS=$IFS
IFS=""


sourceDir=$1
destDir=$2

if [ $# -ne 2 ]
then
	echo "Error: Invalid number of arguments!"
	exit 1
fi

if [ ! -d $sourceDir ]
then
	echo "Error: Invalid input!"
	exit 1
fi

if [ ! -x $sourceDir ]
then
	echo "Error: Access denied!"
fi

if [ ! -e $destDir ]
then
	`mkdir $destDir`
fi

readarray -t array <<< "`ls $sourceDir`"

for i in ${array[@]}
do
	completeSourcePath=`echo "$sourceDir""/""$i" | tr -s "/"`
	completeDestPath=`echo "$destDir""/""$i" | tr -s "/"`
	
	if [ -d $completeSourcePath ]
	then
		`mkdir $completeDestPath`
		if [ -x $completeSourcePath ]
		then
			bash ./4.sh $completeSourcePath $completeDestPath 	
		else
			echo "Warning: Dir $completeSourcePath has no permission. Skipping"
		fi
	elif [ -L $completeSourcePath ]
	then
		linkTarget=`readlink $completeSourcePath`
		`ln -s $linkTarget $completeDestPath`
	else
		`cp $completeSourcePath $completeDestPath`
	fi
done