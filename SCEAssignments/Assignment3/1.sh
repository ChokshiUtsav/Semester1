#!/bin/bash

var1=5
var2=7
var3=11

function checkDivisibility()
{
	val=$i
	ans=`expr $val % $var1`
	while [ $ans -eq 0 ]
	do
		val=`expr $val / $var1`
		ans=`expr $val % $var1`
	done

	ans=`expr $val % $var2`
	while [ $ans -eq 0 ]
	do
		val=`expr $val / $var2`
		ans=`expr $val % $var2`
	done

	ans=`expr $val % $var3`
	while [ $ans -eq 0 ]
	do
		val=`expr $val / $var3`
		ans=`expr $val % $var3`
	done

	if [ $val -eq 1 ]
	then
	echo $i
	fi
}

for i in {1..1000}
do
	checkDivisibility
done