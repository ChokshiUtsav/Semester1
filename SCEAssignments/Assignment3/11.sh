#!/bin/bash

if [ $# -lt 5 ]
then
	echo "Error: Usage: <Rollno> <TarPath> <Tar pattern> <Inside folder pattern> <Inside file format files> "
	exit 1
fi

providedRollNumber=$1
myRollNumber="201505581"
tarFile=$2
tarPattern=$3
folderPattern=$4
fileType[0]=$5
index=0

if [ $# -le 6 ]
then
	fileType[1]=$6
	index=1
fi

if [ $# -le 7 ]
then
	fileType[2]=$7
	index=2
fi


patternToMatch="$myRollNumber""_""$tarPattern"".tar.gz"
echo $patternToMatch

if [ -e $tarFile ]
then
	if [ $tarFile = $patternToMatch ]
	then
		`tar -tzf "$tarFile" > /dev/null`
		if [ $? -ne 0 ]
		then
			echo "Error: In extracting tar File"
		else
			`tar -xvf "$tarFile"`
			 patternToMatch="$myRollNumber""_""$folderPattern"
			 `ls "$patternToMatch" > /dev/null`
			 if [ $? -eq 0 ]
			 then
			 	flag=0
			 	readarray -t array <<< "$(ls $patternToMatch)"
			 	for i in ${array[@]}
			 	do
			 		for j in ${fileType[@]}
			 		do
			 			`echo $i | grep "*."'"$j"'"$"`
			 			if [ $? -eq 0 ]
			 			then
			 				flag=1
			 				break
			 			fi
			 		done
			 		if [ flag -eq 0 ]
			 		then
			 			echo "Error: Internal file invalid format"
			 			echo $i
			 		fi
			 	done
			 else
			 	echo 'Error: Invalid Folder Name'
			 fi	
		fi
	else
		echo "Error: Invalid Tar Name"
	fi
else
	echo "Error: Invalid tar path"
fi