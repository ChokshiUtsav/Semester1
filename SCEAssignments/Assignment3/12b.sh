#!/bin/bash

function plot1()
{
	gnuplot << EOF
	set xlabel "Time(secs)"
	set ylabel "Utilization"
	set title "Utilization vs Time"
	set yrange [0.12:0.15]
	#set yrange [0:1]
	#set yrange [$minVal:$maxVal]
	set term png
	set output "op8.png"
	#set output $outputFile
	plot [1:17] "resource1.db" with lines
	EOF	
}

utilType=$1
option=$2
file="resource.db"
rollNumber="201505581"

if [ $# -ne 2 ]
then
	echo "Invalid number of arguments!"
	exit 1
fi

if [ $number -eq $number > /dev/null 2>&1 ]
then
	if [ $utilType -eq 1 ]
	then
		typeName="cpu"	
	elif [ $utilType -eq 2 ]
	then
		typeName="memory"
	elif [ $utilType -eq 3 ]
	then
		typeName="disk"
	elif [ $utilType -eq 4 ]
	then
		typeName="network"
	else
		echo "Invalid argument"
		exit 1
	fi
else
	echo "Invalid argument"
	exit 1
fi


if [ -e $file ]
then
	if [ -s $file ]
	then
	 maxVal=`cat resource.db | awk -v var="$var" 'BEGIN{FS=",";Max=0}{if($var > Max) Max=$var }END{print Max}'`
	 minVal=`cat resource.db | awk -v var="$var" 'BEGIN{FS=",";Min=2}{if($var < Min) Min=$var }END{print Min}'`

		if [ $option = "l" ]
		then
			 latestVal=`cat resource.db | tail -1 | awk 'BEGIN{FS=","}{print $"'"$utilType"'"}'`
			 echo $latestVal
		elif [ $option = "a" ]
		then
			 avgVal=`cat resource.db | awk -v var="$var" 'BEGIN{FS=",";Sum=0}{Sum=Sum+$var}END{Avg=Sum/NR; print Avg}'`
			 echo $avgVal
		elif [ $option = "m" ]
		then
			 echo $maxVal
		elif [ $option = "s" ]
		then
			 echo $minVal
		elif [ $option = "p" ]
		then

			outputFile="$typeName""_""$rollNumber"".png"
			#echo $outputFile
			plot1
		else
			echo "Invalid argument"
			exit 1
		fi
	else
		echo "No Entries"
		exit 1			
	fi
else
	echo "No Entries"
	exit 1
fi