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

#
echo "1.insert(i)"
echo "2.remove(r)"
echo "3.display(d)"
echo "4.select(s)"
read -p "Please select one of the above option : " option


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


#if [ $option -eq d ]
#then
#fi

#if [ $option -eq s ]
#then
#fi