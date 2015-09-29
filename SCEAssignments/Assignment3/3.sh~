#!/bin/bash

pi=3.142
var1=180.0

for i in {0..360..10}
do
	val=`echo "$i*$pi"|bc`
	val=`echo "$val/$var1"|bc -l`
	printf "%d\t%1.4f\n" $i $val
done


