#!/bin/bash

pi=3.142
var1=180.0
var1=`echo "$pi/$var1"|bc -l`

for i in {0..360..10}
do
	val=`echo "$i*$var1"|bc -l`
	#val=`echo "$val/$var1"|bc -l`
	val=`echo "s($val)" | bc -l`
	printf "%d\t%1.4f\n" "$i" "$val"
done


