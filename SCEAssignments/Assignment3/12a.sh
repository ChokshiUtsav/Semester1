#!/bin/bash

while true
do
		#echo "CPU Utilization : "
		CPUUtil=`top | head -4 | grep 'Cpu' | awk '{print $2}'`
		CPUUtil=`echo "scale=4;$CPUUtil/100" | bc`
		#printf "%2.4f\n" "$CPUUtil"

		#echo "Memory Utilization : "
		TotalMemUtil=`free -m | grep Mem | tr ':' ' ' | tr -s ' ' | cut -f2 -d' '`
		#echo $TotalMemUtil
		UsedMemUtil=`free -m | grep Mem | tr ':' ' ' | tr -s ' ' | cut -f3 -d' '`
		#echo $UsedMemUtil
		MemUtil=`echo "scale=4;$UsedMemUtil/$TotalMemUtil" | bc`
		#printf "%2.4f\n" "$MemUtil"

		#echo "Disk Utilization : "
		DiskUtil=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
		#echo $DiskUtil
		DiskUtil=`echo "scale=4;$DiskUtil/100" | bc`
		#printf "%2.4f\n" "$DiskUtil"

		#echo "Network Utilization : "
		IncomingPackets=`netstat -s | head -10 | grep 'total packets received' | awk '{print $1}'`
		OutgoingPackets=`netstat -s | head -10 | grep 'requests sent out' | awk '{print $1}'`
		TotalPackets=`echo "scale=4;$IncomingPackets+$OutgoingPackets" | bc`
		NetUtil=`echo "scale=4;$IncomingPackets/$TotalPackets" | bc`
		#printf "%2.4f\n" "$NetUtil"

		file="resource.db"
		if [ -e $file ]
		then
			`touch "$file"`
		fi

		row=`printf "%2.4f,%2.4f,%2.4f,%2.4f" "$CPUUtil" "$MemUtil" "$DiskUtil" "$NetUtil"`
		echo $row >> $file

		`sleep 1`
done