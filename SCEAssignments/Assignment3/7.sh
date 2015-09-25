#!/bin/bash

function lsRec(){
	local temp=$1
	echo "$temp" ":"
	readarray -t array <<< "`ls $temp`"
	for i in ${array[@]}
	do
		printf "%s\n" "$i"
	done
	printf "\n"

	for i in ${array[@]}
	do
		i="$temp"/"$i"
		if [ -d $i ]
		then	
			lsRec $i
		fi
	done
}

if [ $# -eq 0 ]
then
	lsRec "."
else
	for var in "$@"
	do
		if [ -e $var ]
		then
			if [ -d $var ]
			then
				if [ -x $var ]
				then
					lsRec $var
				else
					echo "Warning: No permission"
				fi
			else
				echo $var
			fi
		else
			echo "Error: Invalid File/Directory!"
		fi
	done
fi
