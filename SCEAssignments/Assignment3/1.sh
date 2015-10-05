#!/bin/bash

var1=5
var2=7
var3=11

function checkDivisibility()
{
	val=$i
	#ans=`expr $val % $var1`
	let ans=$val%$var1
	while [ $ans -eq 0 ]
	do
		let val=$val/$var1
		#val=`expr $val / $var1`
		let ans=$val%$var1
		#ans=`expr $val % $var1`
	done

	#ans=`expr $val % $var2`
	let ans=$val%$var2
	while [ $ans -eq 0 ]
	do
		let val=$val/$var2
		#val=`expr $val / $var2`
		let ans=$val%$var2
		#ans=`expr $val % $var2`
	done

	#ans=`expr $val % $var3`
	let ans=$val%$var3
	while [ $ans -eq 0 ]
	do
		let val=$val/$var3
		#val=`expr $val / $var3`
		let ans=$val%$var3
		#ans=`expr $val % $var3`
	done

	if [ $val -eq 1 ]
	then
		echo $i
	fi
}

for i in {2..1000}
do
	checkDivisibility
done
