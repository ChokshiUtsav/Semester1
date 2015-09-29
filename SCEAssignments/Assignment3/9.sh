#!/bin/bash

index=0
flag=2

#Accessing commandline arguments and seperating items and quanity
for i in $*
do
	if [ $flag -eq 2 ]
	then
		sourceDir=$i
		flag=0		
	elif [ $flag -eq 0 ]
	then
		item[index]=$i
		flag=1
    else
    	quantity[index]=$i
    	flag=0
    	index=` expr $index + 1 `
    fi
done

numberOfItems=$index

#Accessing restaurant files and storing their names 
OLDIFS=$IFS
IFS=""
readarray -t res <<< `ls $sourceDir`

#Verifying one item is selected from each category
#remaining


#Generating bill from each restaurant
index=0
flag=0
subIndex=0
for i in ${res[@]}
do
	completeFileName="$sourceDir""$i"
	distance[index]=`cat $completeFileName | head -1 | tr -d "km"`
	sum=0
	subIndex=0
	for j in ${item[@]}
	do
		`grep "$j" "$completeFileName" > /dev/null`
		if [ $? -ne 0 ]
		then
			echo "Item Not Found"
			exit 1
		fi
		price=`grep "$j" "$completeFileName" | awk 'BEGIN{FS=","}{print $2}' | tr -d ' '`
		quant=${quantity[subIndex]}
		price=` expr $price \* $quant `
		sum=` expr $sum + $price `
		subIndex=` expr $subIndex + 1 `
	done
	bill[index]=$sum
	index=` expr $index + 1 `
done

#Searching minimum bill
index=0
minIndex=0
minBill=10000000
for i in ${bill[@]}
do
	if [ $i -le $minBill ]
	then
		if [ $i -eq $minBill ]
		then
			if [ distance[index] -lt distance[minIndex] ]
			then
				minIndex=$index
			fi
		else
			minIndex=$index
			minBill=$i
		fi
	fi
	index=` expr $index + 1 `
done

echo "${res[minIndex]}"":""$minBill"
