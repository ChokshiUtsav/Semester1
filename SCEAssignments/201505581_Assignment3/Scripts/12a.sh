#!/bin/bash

while true
do
		CPUUtil=`top -bn1 | grep load | awk '{print $10}'| tr -d ','`
		
		TotalMemUtil=`free -m | grep Mem | tr ':' ' ' | tr -s ' ' | cut -f2 -d' '`
		UsedMemUtil=`free -m | grep Mem | tr ':' ' ' | tr -s ' ' | cut -f3 -d' '`
		MemUtil=`echo "scale=4;$UsedMemUtil/$TotalMemUtil" | bc`

		DiskUtil=`df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1`
		DiskUtil=`echo "scale=4;$DiskUtil/100" | bc`
		
		IncomingPackets=`cat /proc/net/dev | awk '{if(NR==3)print $3}'`
		OutgoingPackets=`cat /proc/net/dev | awk '{if(NR==3)print $11}'`
		TotalPackets=`echo "scale=4;$IncomingPackets+$OutgoingPackets" | bc`
		NetUtil=`echo "scale=4;$IncomingPackets/$TotalPackets" | bc`
		
		file="resource.db"
		
		row=`printf "%1.2f,%1.2f,%1.2f,%1.2f" "$CPUUtil" "$MemUtil" "$DiskUtil" "$NetUtil"`
		echo $row >> $file

		`sleep 1`
done