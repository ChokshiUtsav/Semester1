#!/bin/bash

OLDIFS=$IFS
IFS=','
metaFile=$1

#stores field names in array
readarray -t fieldNames <<< "`cat $metaFile`"

#calculates number of fields
totalFields=0  
for i in ${fieldNames[@]}
do
	totalFields=`expr $totalFields + 1 `
done
#echo $totalFields

#creating .db file
dbFile="$(echo $metaFile | tr -d '.meta')"
dbFile="$dbFile"".db"
`touch $dbFile`
#echo $dbFile

#asking for options
echo "1.insert(i)"
echo "2.remove(r)"
echo "3.display(d)"
echo "4.select(s)"
read -p "Please select one of the above option : " option


#Processing insert operation
temp=""
flag=0
if [ $option = "i" ]
then
	for i in ${fieldNames[@]}
	do
		read -p "$i : " ans
		if [ $flag -eq 0 ]
		then
			temp=$ans
			flag=1
		else	
			temp=$temp","$ans
		fi
	done
	IFS=$OLDIFS
	echo $temp >> $dbFile
fi

#Processing remove operation
if [ $option = "r" ]
then
	totalLines=`wc -l $dbFile | awk '{ print $1 }'`	
	read -p "Enter line number : " line
	if [ $line -gt $totalLines ]
	then
		echo "delete was unsuccessful"
	else
		`sed -i.bak -e ''"$line"'d' $dbFile`
		echo "deleted successfully"
    fi
fi

flag=0
str="-----------------------------------------------------------------"
#Processing display operation
if [ $option = "d" ]
then
	for i in ${fieldNames[@]}
	do
		if [ $flag -eq 0 ]
		then
			printf "%-15s " "$i"
			flag=1
		else
			printf "| %-10s " "$i"
	    fi				
	done
	printf "\n"
	printf "%s\n" "$str"

	IFS=','	
	readarray -t line <<< "`cat $dbFile`"
	flag=0
	count=1
	for i in ${line[@]}
	do
		if [ $flag -eq 0 ]
		then
			printf "%-15s " "$i"
			flag=1
		else
			printf "| %-10s " "$i"
	    fi
	    
	    count=`expr $count + 1 `
	    if [ $count -gt $totalFields ]
	    then
	    	printf "\n"
	    	flag=0
	    	count=1
	    fi
	done
fi

#if [ $option -eq s ]
#then
#fi