#!/bin/bash

OLDIFS=$IFS
IFS=""

if [ $# -lt 5 ]
then
	echo "Error: Usage: <Rollno> <TarPath> <Tar pattern> <Inside folder pattern> <Inside file format files> "
	exit 1
fi

providedRollNumber=$1
tarFile=$2
tarPattern=$3
folderPattern=$4
fileType[0]=$5
index=0
validationCheck=0

if [ $# -eq 6 ]
then
	fileType[1]=$6
	index=1
fi

if [ $# -eq 7 ]
then
	fileType[1]=$6
	fileType[2]=$7
	index=2
fi

patternToMatch="$providedRollNumber""_""$tarPattern"".tar.gz"


if [ -e $tarFile ]
then
	if [ $tarFile = $patternToMatch ]
	then
		`tar -tzf "$tarFile" > /dev/null 2>&1`
		if [ $? -ne 0 ]
		then
			echo "Error: In extracting tar File"
		else
			`tar -xvf "$tarFile" > /dev/null 2>&1`
			 patternToMatch="$providedRollNumber""_""$folderPattern"
			 `ls "$patternToMatch" > /dev/null 2>&1`
			 if [ $? -eq 0 ]
			 then
			 	readarray -t array <<< "$(ls "$patternToMatch")"
			 	
			 	for i in ${array[@]}
			 	do
			 		flag=0
			 		for j in ${fileType[@]}
			 		do
			 			regex=".*.""$j"
			 			echo "$i" | grep "$regex" > /dev/null 2>&1
			 			#grep "$regex" "$i"
			 			if [ $? -eq 0 ]
			 			then
			 				flag=1
			 				break
			 			fi
			 		done
			 		if [ $flag -eq 0 ]
			 		then
			 			echo "Error: Internal file invalid format"
			 			echo $i
			 			validationCheck=1
			 		fi
			 	done
			 	if [ $validationCheck -eq 0 ]
			 	then
			 		echo "Good one"
			 	fi
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